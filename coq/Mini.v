Require Export CoqCore.MoreList CoqCore.MoreForall Arith CoqCore.Tactic Omega Program.
Require Recdef.
Variable Rest : Type.
Inductive expr := 
| If (a b c : expr) 
| And (l : list expr) 
| Or (l : list expr)
| Imply (a b : expr)
| Not (a : expr)
| Unknown (R : Rest) (l : list expr)
| UnknownAtom (R : Rest).

Variable UnknownDenote : Rest -> list expr -> bool.
Variable UnknownAtomDenote : Rest -> bool.
Variable RestEqDec : forall l r : Rest, { l = r } + { l <> r }.
Hint Resolve list_eq_dec RestEqDec.
Fixpoint exprEqDec (l r : expr) : { l = r } + { l <> r }.
  decide equality; auto.
Qed.

Fixpoint BDenote (e : expr) : bool :=
  match e with
  | If a b c => if BDenote a then BDenote b else BDenote c
  | And l => forallb BDenote l
  | Or l => existsb BDenote l
  | Imply a b => implb (BDenote a) (BDenote b)
  | Not a => negb (BDenote a)
  | Unknown R l => UnknownDenote R l
  | UnknownAtom R => UnknownAtomDenote R
  end.

Fixpoint Size (e : expr) :=
  S 
    match e with
    | If a b c => (Size a + Size b + Size c)
    | And l => (fold_left plus (map Size l) 0)
    | Or l => (fold_left plus (map Size l) 0)
    | Imply a b => (Size a + Size b)
    | Not a => Size a
    | Unknown R l => (fold_left plus (map Size l) 0)
    | UnknownAtom R => 0
    end.

Theorem maxD n m : max n m = if le_lt_dec n m then m else n.
  destruct le_lt_dec; auto with *.
Qed.

Function IfAndR (ex : expr) { measure Size ex } : expr :=
  match ex with
  | And [(If a b c); (If d e f)] =>
      if exprEqDec a d then And [(If a (IfAndR (And [b; e])) (IfAndR (And [c; f])))] else ex
  | _ => ex
  end.
  all: program_simpl; simpl; omega.
Qed.

Theorem IfAndRPreserve e : BDenote (IfAndR e) = BDenote e.
  intros.
  eapply IfAndR_rect; program_simpl.
  repeat (unfold andb in *; try match_destruct; subst; simpl in *; try congruence).
Qed.

Fixpoint IfAnd (ex : expr) : expr :=
  match ex with
  | If a b c => If (IfAnd a) (IfAnd b) (IfAnd c)
  | And [l; r] => IfAndR ex
  | And l => And (map IfAnd l)
  | Or l => Or (map IfAnd l)
  | Imply l r => Imply (IfAnd l) (IfAnd r)
  | Not a => Not (IfAnd a)
  | Unknown r l => Unknown r (map IfAnd l)
  | UnknownAtom r => UnknownAtom r
  end.

Variable RestBDenoteModular : forall R l l', 
  map BDenote l = map BDenote l' -> UnknownDenote R l = UnknownDenote R l'.

Program Fixpoint expr_ind_Forall
  (P : expr -> Prop)
  (PIf : forall a b c, P a -> P b -> P c -> P (If a b c))
  (PAnd : forall l, Forall P l -> P (And l))
  (POr : forall l, Forall P l -> P (Or l))
  (PImply : forall a b, P a -> P b -> P (Imply a b))
  (PNot : forall a, P a -> P (Not a))
  (PUnknown : forall R l, Forall P l -> P (Unknown R l))
  (PUnknownAtom : forall R, P (UnknownAtom R)) e : P e :=
  let F := (expr_ind_Forall P PIf PAnd POr PImply PNot PUnknown PUnknownAtom) in
    match e with
    | If a b c => PIf a b c (F a) (F b) (F c)
    | And l => PAnd l (list_ind _ _ (fun ex _ _ => Forall_cons ex (F ex) _) l)
    | Or l => POr l (list_ind _ _ (fun ex _ _ => Forall_cons ex (F ex) _) l)
    | Imply a b => PImply a b (F a) (F b)
    | Not a => PNot a (F a)
    | Unknown R l => PUnknown R l (list_ind _ _ (fun ex _ _ => Forall_cons ex (F ex) _) l)
    | UnknownAtom R => PUnknownAtom R
    end.

Hint Resolve IfAndRPreserve.
Definition IfAndPreserve : forall e, BDenote (IfAnd e) = BDenote e.
  eapply expr_ind_Forall; intros; simpl in *; 
  try induction l;
  repeat (
    unfold implb in *; unfold andb in *;
    ForallInvcs; try match_destruct; subst; simpl in *; 
    try rewrite !IfAndRPreserve in *; try congruence).
  apply RestBDenoteModular; simpl; rewrite H2; f_equal.
  rewrite map_map; apply map_ext_in; intros; eapply Forall_forall in H3; eauto.
Qed.
