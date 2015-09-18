Require Export CoqCore.MoreForall Arith CoqCore.Tactic Omega Program.
Require Recdef.
Variable Rest : Type.
Inductive expr := 
| If (a b c : expr) 
| And (a b : expr) 
| Unknown (R : Rest) (l : list expr)
| UnknownAtom (R : Rest).
Variable UnknownDenote : Rest -> list expr -> bool.
Variable UnknownAtomDenote : Rest -> bool.
Variable RestEqDec : forall l r : Rest, { l = r } + { l <> r }.
Fixpoint exprEqDec (l r : expr) : { l = r } + { l <> r }.
  decide equality; [apply list_eq_dec; apply exprEqDec|apply RestEqDec|apply RestEqDec].
Qed.

Fixpoint BDenote (e : expr) : bool :=
  match e with
  | If a b c => if BDenote a then BDenote b else BDenote c
  | And a b => BDenote a && BDenote b
  | Unknown R l => UnknownDenote R l
  | UnknownAtom R => UnknownAtomDenote R
  end.

Fixpoint NumIf (e : expr) :=
  match e with
  | If a b c => S (max (max (NumIf a) (NumIf b)) (NumIf c))
  | And a b => max (NumIf a) (NumIf b)
  | Unknown R l => fold_left max (map NumIf l) 0
  | UnknownAtom R => 0
  end.

Fixpoint Size (e : expr) :=
  S 
    match e with
    | If a b c => (Size a + Size b + Size c)
    | And a b => (Size a + Size b)
    | Unknown R l => (fold_left plus (map Size l) 0)
    | UnknownAtom R => 0
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
  | And l r => IfAndR ex
  | Unknown r l => Unknown r (map IfAnd l)
  | UnknownAtom r => UnknownAtom r
  end.

Variable RestBDenoteModular : forall R l l', 
  map BDenote l = map BDenote l' -> UnknownDenote R l = UnknownDenote R l'.

Program Fixpoint expr_ind_Forall
  (P : expr -> Prop)
  (PIf : forall a b c, P a -> P b -> P c -> P (If a b c))
  (PAnd : forall a b, P a -> P b -> P (And a b))
  (PUnknown : forall R l, Forall P l -> P (Unknown R l))
  (PUnknownAtom : forall R, P (UnknownAtom R)) e : P e :=
  let F := (expr_ind_Forall P PIf PAnd PUnknown PUnknownAtom) in
    match e with
    | If a b c => PIf a b c (F a) (F b) (F c)
    | And a b => PAnd a b (F a) (F b)
    | Unknown R l => PUnknown R l (list_ind _ _ (fun ex _ _ => Forall_cons ex (F ex) _) l)
    | UnknownAtom R => PUnknownAtom R
    end.

Definition IfAndPreserve : forall e, BDenote (IfAnd e) = BDenote e.
  eapply expr_ind_Forall; intros; simpl in *; trivial.
  repeat (try match_destruct; subst; simpl in *; try congruence).
  apply IfAndRPreserve.
  apply RestBDenoteModular; rewrite map_map; apply map_ext_in.
  intros; eapply Forall_forall in H; eauto.
Qed.
Extraction Language Scheme.
Extract Constant RestEqDec => "(lambdas (l r) (if (eq? l r) `(Left) `(Right)))".
Extraction "z3o" IfAnd.

