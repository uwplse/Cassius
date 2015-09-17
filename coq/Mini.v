Require Export CoqCore.MoreForall Arith CoqCore.Tactic Omega Program.
Require Recdef.
Variable Rest : Type.
Inductive expr := If (a b c : expr) | And (a b : expr) | Unknown (R : Rest) (l : list expr).
Variable RestDenote : Rest -> list expr -> bool.
Variable RestEqDec : forall l r : Rest, { l = r } + { l <> r }.
Fixpoint exprEqDec (l r : expr) : { l = r } + { l <> r }.
  decide equality; [apply list_eq_dec; apply exprEqDec|apply RestEqDec].
Qed.

Fixpoint BDenote (e : expr) : bool :=
  match e with
  | If a b c => if BDenote a then BDenote b else BDenote c
  | And a b => BDenote a && BDenote b
  | Unknown R l => RestDenote R l
  end.

Fixpoint NumIf (e : expr) :=
  match e with
  | Unknown R l => fold_left max (map NumIf l) 0
  | If a b c => S (max (max (NumIf a) (NumIf b)) (NumIf c))
  | And a b => max (NumIf a) (NumIf b)
  end.

Fixpoint Size (e : expr) :=
  match e with
  | Unknown R l => S (fold_left plus (map Size l) 0)
  | If a b c => S (Size a + Size b + Size c)
  | And a b => S (Size a + Size b)
  end.

Theorem maxD n m : max n m = if le_lt_dec n m then m else n.
  destruct le_lt_dec; auto with *.
Qed.
Function IfAndR (ex : expr) { measure Size ex } : expr :=
  match ex with
  | And (If a b c) (If d e f) =>
      if exprEqDec a d then (If a (IfAndR (And b e)) (IfAndR (And c f))) else ex
  | _ => ex
  end.
  all: intros; simpl; subst; omega.
Qed.
Theorem IfAndRPreserve e : BDenote (IfAndR e) = BDenote e.
  intros.
  eapply IfAndR_rect; intros; simpl in *; trivial; subst;
  repeat (try match_destruct; subst; simpl in *; try congruence).
Qed.
Fixpoint IfAnd (ex : expr) : expr :=
  match ex with
  | If a b c => If (IfAnd a) (IfAnd b) (IfAnd c)
  | Unknown r l => Unknown r (map IfAnd l)
  | And l r => IfAndR ex
  end.
Variable RestBDenoteModular : forall R l l', 
  map BDenote l = map BDenote l' -> RestDenote R l = RestDenote R l'.

Program Fixpoint expr_ind_Forall
  (P : expr -> Prop)
  (PIf : forall a b c, P a -> P b -> P c -> P (If a b c))
  (PAnd : forall a b, P a -> P b -> P (And a b))
  (PUnknown : forall R l, Forall P l -> P (Unknown R l)) e : P e :=
  let F := (expr_ind_Forall P PIf PAnd PUnknown) in
    match e with
    | If a b c => PIf a b c (F a) (F b) (F c)
    | And a b => PAnd a b (F a) (F b)
    | Unknown R l => PUnknown R l (list_ind _ _ (fun ex _ _ => Forall_cons ex (F ex) _) l)
    end.

Definition IfAndPreserve : forall e, BDenote (IfAnd e) = BDenote e.
  eapply expr_ind_Forall; intros; simpl in *.
  repeat (try match_destruct; subst; simpl in *; try congruence).
  apply IfAndRPreserve.
  apply RestBDenoteModular; rewrite map_map; apply map_ext_in.
  intros; eapply Forall_forall in H; eauto.
Qed.
Extraction Language Scheme.
Extract Constant RestEqDec => "(lambdas (l r) (if (eq? l r) `(Left) `(Right)))".
Extraction "z3o" IfAnd.

