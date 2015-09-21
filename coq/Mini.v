Require Export 
  Arith Omega Program Bool 
  CoqCore.MoreForall CoqCore.Tactic CoqMonad.OptionMonad CoqFunctor.Functor.
Require Recdef.
Variable Rest : Type.
Inductive expr :=
| If (a b c : expr)
| And (a b : expr)
| Assert (a : expr)
| Unknown (R : Rest) (l : list expr)
| UnknownAtom (R : Rest).
Definition ExprDenoteType := option bool.
Variable UnknownDenote : Rest -> list expr -> ExprDenoteType.
Variable UnknownAtomDenote : Rest -> ExprDenoteType.
Variable RestEqDec : forall l r : Rest, { l = r } + { l <> r }.
Create HintDb mini.
Hint Resolve list_eq_dec RestEqDec : mini.
Fixpoint exprEqDec (l r : expr) : { l = r } + { l <> r }.
  decide equality; auto with mini.
Qed.

Definition ite { T } (t : bool) (l r : T) := if t then l else r.

Fixpoint ExprDenote (e : expr) : ExprDenoteType :=
  match e with
  | If a b c => fmap
  | And a b => (ExprDenote a) && (ExprDenote b)
  | Assert _ => true
  | Unknown l R => UnknownDenote l R
  | UnknownAtom R => UnknownAtomDenote R
  end.

Fixpoint Size (e : expr) :=
  S 
    match e with
    | If a b c => (Size a + Size b + Size c)
    | And a b => (Size a + Size b)
    | Assert a => Size a
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
  | And l r => And (IfAndR l) (IfAndR r)
  | _ => ex
  end.
  all: intros; simpl; subst; omega.
Qed.

Theorem IfAndRPreserve (ex : expr) : ExprDenote (IfAndR ex) = ExprDenote ex.
  eapply IfAndR_ind; program_simpl; repeat (congruence || match_destruct).
Qed.

Fixpoint IfAnd (ex : expr) : expr :=
  match ex with
  | If a b c => If (IfAnd a) (IfAnd b) (IfAnd c)
  | And l r => IfAndR ex
  | Assert a => Assert (IfAnd a)
  | Unknown r l => Unknown r (map IfAnd l)
  | UnknownAtom r => UnknownAtom r
  end.

Program Fixpoint expr_ind_Forall
  (P : expr -> Prop)
  (PIf : forall a b c, P a -> P b -> P c -> P (If a b c))
  (PAnd : forall a b, P a -> P b -> P (And a b))
  (PAssert : forall a, P a -> P (Assert a))
  (PUnknown : forall R l, Forall P l -> P (Unknown R l))
  (PUnknownAtom : forall R, P (UnknownAtom R)) e : P e :=
  let F := (expr_ind_Forall P PIf PAnd PAssert PUnknown PUnknownAtom) in
    match e with
    | If a b c => PIf a b c (F a) (F b) (F c)
    | And a b => PAnd a b (F a) (F b)
    | Assert a => PAssert a (F a)
    | Unknown R l => PUnknown R l (list_ind _ _ (fun ex _ _ => Forall_cons ex (F ex) _) l)
    | UnknownAtom R => PUnknownAtom R
    end.
Hint Rewrite IfAndRPreserve : mini.
Hint Extern 1 => autorewrite with mini : mini.
Variable UnknownExprDenoteModular : forall R l l', 
  map ExprDenote l = map ExprDenote l' -> UnknownDenote R l = UnknownDenote R l'.

Theorem IfAndPreserve : forall e, ExprDenote (IfAnd e) = ExprDenote e.
  eapply expr_ind_Forall; intros; simpl in *; auto with mini.
  + unfold andb in *; repeat (try match_destruct; subst; simpl in *; try congruence).
  + apply UnknownExprDenoteModular; rewrite map_map; apply map_ext_in; 
    intros; eapply Forall_forall in H; eauto.
Qed.

Variable Assertion : Type.
Definition AS := list Assertion.