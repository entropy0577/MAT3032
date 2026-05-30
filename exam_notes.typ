// MAT3032 Advanced Algebra — A4 Landscape Exam Notes
#set page(paper: "a4", flipped: true, margin: (top: 0.2cm, bottom: 0.2cm, left: 0.2cm, right: 0.2cm))
#set text(font: "New Computer Modern", size: 6.5pt, weight: "regular")
#set par(justify: true, leading: 0.2em, spacing: 0.1em)
#set heading(numbering: none)
#show heading.where(level: 1): set text(size: 7.5pt, weight: "bold")
#show heading.where(level: 2): set text(size: 7pt, weight: "bold")
#show heading.where(level: 3): set text(size: 7pt, weight: "bold")
#show heading: set block(above: 0.2em, below: 0.2em)
#set enum(indent: 0pt, body-indent: 2pt, spacing: 0.15em)
#set list(indent: 0pt, body-indent: 2pt, spacing: 0.15em)
#show: columns.with(4, gutter: 4pt)
#show math.equation: set text(font: "New Computer Modern Math")
#show math.equation.where(block: false): set text(bottom-edge: "bounds", top-edge: "bounds")

#let thm(title, body) = block(
  width: 100%, inset: (x: 1.5pt, y: 1pt), radius: 1pt,
  stroke: 0.3pt + luma(120), fill: luma(245),
  [*#title.* #body]
)
#let defn(title, body) = block(
  width: 100%, inset: (x: 1.5pt, y: 1pt), radius: 1pt,
  stroke: 0.3pt + rgb("#2563eb"), fill: rgb("#eff6ff"),
  [*#title.* #body]
)
#let prf(body) = block(
  width: 100%, inset: (x: 1.5pt, y: 1pt), radius: 1pt,
  stroke: 0.3pt + rgb("#9333ea"), fill: rgb("#faf5ff"),
  [_Proof._ #body]
)

= Groups

== Fundamentals

#defn[Group][$(G, ast)$ is a set w/ assoc. binary op, identity $e$, and inverses. *Abelian* if commutative.]
#defn[Subgroup Test][For non-empty $H subset.eq G$, $H lt.eq G$ iff $a b^(-1) in H$ $forall a, b in H$.]
#thm[Lagrange's Theorem][If $H lt.eq G$ and $G$ is finite, then $|H|$ divides $|G|$. Index $[G:H] = |G| \/ |H|$.]
#defn[Element Order][$o(a)$ is the smallest $k in NN^+$ s.t. $a^k = e$ (if no such $k$ exists, order is infinite). Note: By Lagrange, $o(a) | |G|$.]
#defn[Homomorphism][Map $phi: G_1 -> G_2$ preserving op. *Kernel*: $ker phi = {g : phi(g) = e}$. *Image*: $phi(G_1)$. Injective iff $ker phi = {e}$. *Surjective* if $phi(G_1)=G_2$. *Iso* if bijective. *Auto* if iso $G -> G$.]

*Group Families:* *Cyclic* $C_n = chevron.l g : g^n = e chevron.r tilde.eq (ZZ_n, +_n)$, $phi(n)$ generators, unique subgp of order $d | n$. *Units* $U_n$: units of $(ZZ_n, times_n)$, order $phi(n)$. *$op("GL")(n,R)$, $op("SL")(n,R)$*: general/special linear. *$R_n$* (course-specific): upper triangular $n times n$ w/ 1s on diag. *$S_n$*: symmetric gp, order $n!$ (has cycle notation & sign function). *$A_n$*: alternating, order $n! / 2$. *$D_n$*: dihedral, regular $n$-gon syms, order $2n$. *Direct products*: $C_m times C_n tilde.eq C_(m n)$ iff $op("gcd")(m,n) = 1$.

== Generators & Presentations

#defn[Generating Set][$chevron.l S chevron.r$ is the smallest subgroup containing $S$.]
#defn[Presentation][$chevron.l S | R chevron.r$ denotes a group with generators $S$ and defining relations $R$.]

*Examples:* $C_n = chevron.l g | g^n = e chevron.r$; Klein Four $V = chevron.l a,b | a^2 = b^2 = e, a b a = b chevron.r$; $D_n = chevron.l sigma, tau | sigma^n = tau^2 = e, tau sigma tau^(-1) = sigma^(-1) chevron.r$.

*Groups of order 8:* 5 total: $C_8$, $C_4 times C_2$, $C_2^3$ (abelian); $D_4$, $Q_4$ (non-abelian).
_Derivation:_ For non-abelian order 8, non-identity elements have order 2 or 4. Pick $a$ of order 4, $b in.not chevron.l a chevron.r$. $G = {e, a, a^2, a^3, b, a b, a^2 b, a^3 b}$. $b^2 in chevron.l a chevron.r$ commutes w/ $b$, so $b^2 = e$ or $a^2$. Since $G$ is non-abelian, $b$ acts non-trivially on $chevron.l a chevron.r$, forcing $b a b^(-1) = a^(-1)$. If $b^2 = e => D_4$. If $b^2 = a^2 => Q_4$.

#defn[Dicyclic Group][$Q_n$: order $2n$ ($n$ even), $chevron.l a,b | a^n = e, b^2 = a^(n/2), b a b^(-1) = a^(-1) chevron.r$. (Note: $Q_n$ order $2n$ is course-specific notation, often $op("Dic")_(n/2)$). For $Q_4$, Cayley table easily derived from relations.]

== Cosets, Products, Quotients

#defn[Cosets][Left coset $a H = {a h : h in H}$, right $H a$. Cosets partition $G$.]
#defn[Normal Subgroup][$H lt.tri.eq G$ if $a H = H a quad forall a in G$. Equiv: $a H a^(-1) = H quad forall a$. Index 2 is normal. Kernels are normal.]
#thm[Normality via Generators][$H lt.tri.eq G$ iff $g h g^(-1) in H quad forall g$ in gen. set for $G$, $forall h$ in gen. set for $H$ (suffices to check on generating sets).]
#thm[Conjugation Power Rule][$(b a b^(-1))^n = b a^n b^(-1)$; if $b a b^(-1) = a^r$ then $b^n a b^(-n) = a^(r^n)$.]
#thm[Subgroup Product Theorem][
$H J$ is a subgroup iff $J H = H J$. If $H lt.tri.eq G$ or $J lt.tri.eq G => H J lt.eq G$. If both $lt.tri.eq G => H J lt.tri.eq G$.]
#prf[$H J lt.eq G => forall h, j$, $h^(-1) j^(-1) in H J => (h^(-1) j^(-1))^(-1) = j h in H J => J H subset.eq H J$. Similarly $H J subset.eq J H$. Converse via subgroup test.]
#thm[Product Order][$|H J| = (|H| dot |J|) / |H inter J|$.]
#thm[Internal Direct Product][If $G = H J$ and $H inter J = {e}$: Every elt has unique $h j$. $H, J lt.tri.eq G$ iff $h j = j h quad forall h, j$. In this case, $G tilde.eq H times J$.]
#prf[Uniqueness: $h j = h' j' => (h')^(-1) h = j' j^(-1) in H inter J = {e}$. Commute $<=>$ normal: Commutator $h j h^(-1) j^(-1) in H inter J = {e} => h j = j h$. Conversely, commute implies $a H = h j H = j H = H j$, so normal.]

#defn[Quotient Group][$G\/H$ exists when $H lt.tri.eq G$. Cosets $a H$ form a group $(a H)(b H) = a b H$.]
#thm[1st Isomorphism Theorem][If $phi: G_1 -> G_2$ is a homomorphism, then $ker phi lt.tri.eq G_1$ and $G_1 \/ ker phi tilde.eq phi(G_1)$.]
#thm[Correspondence Theorem][Subgroups of $G \/ N$ are $H \/ N$ for $H lt.eq G$ containing $N$. $H \/ N lt.tri.eq G \/ N <=> H lt.tri.eq G$, and $(G \/ N)\/(H \/ N) tilde.eq G \/ H$ (*3rd Isom. Thm*).]
#thm[2nd Isomorphism Theorem][If $H lt.eq G$ and $N lt.tri.eq G$, then $H\/(H inter N) tilde.eq H N \/ N$.]
#thm[Quotient Subgroups][If $G$ is finite and $G \/ N$ is cyclic, $G$ has a subgroup $tilde.eq G \/ N$.]
#prf[If $g N$ generates $G \/ N$ with order $m$, $g$ has order $r = k m$ (since quotient element order divides original). Then $o(g^k) = r/k = m$, so subgroup $chevron.l g^k chevron.r tilde.eq G \/ N$.]

== Finite Abelian Groups

#thm[Fundamental Theorem of Finite Abelian Groups][Every finite abelian group $tilde.eq$ direct product of cyclics:
*Primary:* $C_(p_1^(n_1)) times dots times C_(p_r^(n_r))$;
*Invariant Factor:* $C_(q_1) times dots times C_(q_s)$ with $q_i | q_(i+1)$.]
#prf[Induction on min size of gen. set. Show if $chevron.l g_1 chevron.r inter H eq.not {e}$, one can replace a generator to contradict minimality assumptions.]

*Examples:* Order 54 abelian gps: $C_(54)$, $C_3 times C_(18)$, $C_3^2 times C_6$. \# abelian groups of order $p^k$ is the \# of partitions of $k$.
*Element order:* $o(g_1, dots, g_s) = op("lcm")(o(g_1), dots, o(g_s))$. 
*Generating Sets:* A generator of an abelian group can be factored into elements of disjoint prime-power orders (via Chinese Remainder Theorem).

== Automorphisms & Semi-Direct Products

#thm[Automorphism Group of $C_n$][$op("Aut")(C_n) tilde.eq U_n$, $|op("Aut")(C_n)| = phi(n)$. Auts are $psi_m : g |-> g^m$ for $op("gcd")(m,n) = 1$.]
#defn[Inner Automorphisms][$gamma_a : x |-> a x a^(-1)$. $op("Inn")(G) lt.tri.eq op("Aut")(G)$, and $G \/ Z(G) tilde.eq op("Inn")(G)$.]
#defn[Semi-Direct Product][$H times.r J$ occurs when $G = H J$, $H inter J = {e}$, $H lt.tri.eq G$. $J$ acts on $H$ by conjugation.]

*Groups of order 12:* With $H tilde.eq C_3 lt.tri.eq G, J tilde.eq C_4$. Conjugation by $j in J$ maps $h |-> h$ ($C_(12)$) or $h |-> h^2$ ($Q_(12)$). (If $H eq.not lt.tri.eq G$, leads to contradiction for these Sylows. Doesn't exhaust $A_4, D_6, C_2 times C_6$).
*Characteristic subgroups:* Invariant under all automorphisms. Transitive property ($K op("char") H op("char") G => K op("char") G$). If $N lt.tri.eq G$, $G \/ N$ cyclic, $|N|, |G \/ N|$ coprime, then $G = N times.r Q$ ($Q tilde.eq G \/ N$).
*Homomorphism vs Automorphism:* $phi(a)=a^2$ is a homomorphism iff $G$ is abelian. $op("Aut")(ZZ) tilde.eq C_2$.

= Actions, Conjugacy, Sylow

== Group Actions

#defn[Left Action][Map $(g,x) |-> g(x) in X$ w/ $e(x) = x$ and $g_1(g_2(x)) = (g_1 g_2)(x)$.]
#defn[Orbit and Stabiliser][*Orbit*: $O(x) = {g(x) : g in G}$. *Stabiliser*: $G_x = {g : g(x) = x} lt.eq G$. *Fixed pts*: $op("Fix")(g) = {x : g(x) = x}$. $op("Fix")(G) = {x : g(x)=x quad forall g}$.]
#thm[Orbit-Stabiliser Theorem][Bijection $g(x) <-> g G_x$. For finite $G$: $|O(x)| dot |G_x| = |G|$.]
#prf[$h(x) = g(x) <=> g^(-1)h in G_x <=> h in g G_x$.]
#thm[Orbit Decomposition][$|X| = |op("Fix")(G)| + sum_(i=1)^n [G:G_(x_i)]$ (sum over non-trivial orbit reps).]
#thm[Action Homomorphisms][Action on set size $m =>$ homomorphism $G -> S_m$ w/ kernel $tilde(G)_X = inter G_x$. Subgroup index $m =>$ homomorphism $G -> S_m$ acting on left cosets, kernel $subset.eq$ subgroup.]
#thm[Cayley's Theorem][Every group of order $n$ embeds in $S_n$.]
*Transitive Action:* $O(x) = X$ $forall x$. (e.g. $(RR, +)$ acting on unit circle $S^1$ via $x(z) = e^(i x)z$).
#thm[Smallest Prime Index][If $p$ is the smallest prime factor of $|G|$, any subgroup of index $p$ is normal.]
#prf[Action on $p$ cosets gives homom $G -> S_p$. Image size divides $p!$ and $|G|$. Since prime factors of $|G| gt.eq p$, $|G\/"ker"| = p$, forcing kernel to equal subgroup.]
#thm[Groups of Order $p^2$][Every group of order $p^2$ is abelian ($tilde.eq C_(p^2)$ or $C_p times C_p$).]

== Conjugacy

#defn[Conjugacy Class][$x^G = {g x g^(-1) : g in G}$ (orbit under conjugation).]
#defn[Centraliser and Centre][*Centraliser*: $C_G(x) = {g : g x = x g}$. *Centre*: $Z(G) = {g : g x = x g quad forall x} lt.tri.eq G$.]
#thm[Class Equation][$|G| = |Z(G)| + sum_(x in T) [G : C_G(x)]$ ($T$ = non-central class reps).]
#thm[Cauchy's Theorem][If $p | |G|$, $exists$ element of order $p$.]
#prf[Abelian: decompose into cyclic factors. Non-abelian: if $p | [G:C_G(x)]$ $forall x in T$, then $p | |Z(G)|$ (reduce to abelian). Else $p | |C_G(x)|$ for some $x$, use induction.]
#thm[Centre of Non-Abelian Groups][If $G$ non-abelian, $G \/ Z(G)$ is not cyclic. $Z(G)$ is union of 1-elt classes. $|Z(G)| lt.eq |G|/4$.]
*Conjugates:* A finite group $G$ is never a union of conjugates of a proper subgroup.
#thm[Normal Union][$H lt.tri.eq G$ iff $H$ is a union of conjugacy classes.]
#defn[Normaliser][$N_G(H) = {g : g H = H g}$. $H lt.tri.eq N_G(H)$, \# conjugates of $H$ is $[G : N_G(H)]$.]

== Conjugacy in $S_n$

#defn[Cycle Type][$1^(m_1) 2^(m_2) dots n^(m_n)$ where $m_i$ = \# $i$-cycles. *Number of cycles* $op("cyc")(sigma) = sum m_i$.]
#thm[Conjugation of Cycles][$pi (i_1, dots, i_k) pi^(-1) = (pi(i_1), dots, pi(i_k))$. Conjugate in $S_n <=>$ same cycle type.]
#thm[Class Sizes in $S_n$][Class size is $n! \/ (1^(m_1) 2^(m_2) dots n^(m_n) m_1! dots m_n!)$. Centraliser order is denominator.]
#thm[Subgroups of $S_n$][If $H lt.eq S_n$, either $H subset.eq A_n$ or $|H inter A_n| = |H|\/2$.]
*Conjugacy in $A_n$:* $S_n$-conjugacy class remains a single class in $A_n$ unless its centraliser $subset.eq A_n$, in which case it splits into two equal-sized classes.
*$A_5$ is simple:* Class sizes are 1, 12, 12, 15, 20. No non-trivial union divides 60.
*Parity:* $k$-cycle is even iff $k$ is odd. $sigma$ is even iff $n - op("cyc")(sigma)$ is even. 
*Cycle Counting:* \# $k$-cycles in $S_n$ is $binom(n,k)(k-1)!$.
*Conjugacy in $A_4$:* $(1, 2, 3)$ and $(1, 3, 2)$ NOT conjugate in $A_4$ (conjugator is odd).
*Normal Subgroups of $S_4$:* ${e}$, $V = {e, (12)(34), (13)(24), (14)(23)}$, $A_4$, $S_4$.

== Burnside's Formula

#thm[Burnside's Lemma][\# orbits is $1/|G| sum_(g in G) |op("Fix")(g)|$.]
#prf[Count pairs $g(x) = x$: $sum |op("Fix")(g)| = sum |G_x|$. By orbit-stab, $sum_(x in O) |G_x| = |G|$ per orbit, contributing exactly $|G|$ to total.]
#thm[Colouring Formula][$q$ colours, symmetry $G subset.eq S_n$: \# colourings is $1/|G| sum_(sigma in G) q^(op("cyc")(sigma))$.]

*Examples:* *Hexagon, 3 colours:* Rotations ($C_6$): $1/6(3^6 + 2 dot 3 + 2 dot 9 + 27) = 130$. Full ($D_6$): $1/12(3^6 + 2 dot 3 + 2 dot 9 + 27 + 3 dot 81 + 3 dot 27) = 92$. *Pentagon:* $C_5$: $1/5(q^5 + 4q)$; $D_5$: $1/10(q^5 + 4q + 5q^3)$. *Tetrahedron faces, 4 colours ($A_4$):* $1/12(4^4 + 8 dot 4^2 + 3 dot 4^2) = 36$. *Octahedron (24 syms):* $q$-colourings = $1/24(q^8 + 17q^4 + 6q^2)$.

== $p$-Groups & Sylow Theorems

#thm[$p$-Groups on Finite Sets][$p$-group acting on finite $X$, $|op("Fix")(G)| equiv |X| (mod p)$. Letting $G$ act on itself by conjugation, $Z(G) eq.not {e}$.]
#thm[Normaliser of $p$-Subgroups][For $p$-subgroup $H$, $[N_G(H):H] equiv [G:H] (mod p)$.]
#thm[Sylow Theorems][$|G| = p^k m$ with $p divides.not m$:
(i) $exists$ $p$-Sylow of order $p^k$. (ii) Every $p$-subgroup $subset.eq$ some $p$-Sylow. (iii) All $p$-Sylows conjugate. (iv) $w_p equiv 1 (mod p)$ and $w_p | m$. (v) $[G:N_G(P)] = w_p$.]
#prf[(i)+(ii): Cauchy gives order $p$. Normaliser thm gives $p | [N_G(H):H]$, Corresp Thm guarantees larger until $p^k$. (iii): $P'$ acts on $G \/ P$. $|op("Fix")(P')| equiv m eq.not 0 (mod p)$, coset $b P$ fixed, so $P' subset.eq b P b^(-1)$. (iv): $w_p = [G:N_G(P)]$. Let $q = [N_G(P):P]$. $q w_p = m => w_p | m$. Normaliser thm $m = q + k p => w_p equiv 1 (mod p)$.]

#thm[Sylow Uniqueness][$p$-Sylow unique iff normal. Abelian groups have unique $p$-Sylows. If all Sylows unique, $G tilde.eq$ direct product.]
#thm[Groups of Order $p q$][Primes $p > q$. Abelian is $C_(p q)$. Non-abelian exists iff $q | (p-1)$; unique up to isom, $w_p = 1, w_q = p$.]
#thm[Coprime Automorphisms][If $H lt.tri.eq G$ cyclic, $J lt.eq G$, and $phi(|H|)$ coprime to $|J|$, then $h j = j h quad forall h, j$. If $phi(|H|)$ coprime to $|G|$ then $H subset.eq Z(G)$.]
#prf[Action defines homomorphism $theta: J -> op("Aut")(H)$. $|op("Aut")(H)| = phi(|H|)$ coprime to $|J| => |theta(J)| = 1$.]

*Key Sylow Examples:* #h(1em) *Order 133 ($7 times 19$):* $w_19 = 1, w_7 = 1$. Both normal, $G tilde.eq C_(133)$. #h(1em) *Order 45 ($3^2 times 5$):* $w_5 = 1, w_3 = 1$. All groups abelian: $C_(45), C_3 times C_(15)$. #h(1em) *Order 455 ($5 times 7 times 13$):* $w_13 = 1, w_7 = 1 => C_(91) tilde.eq P_7 P_13 lt.tri.eq G$. $G tilde.eq C_(91) times.r C_5$. $op("Aut")(C_(91)) = 72$ coprime to 5. Semidirect product must be direct (abelian), forcing $w_5 = 1$. $G tilde.eq C_(455)$.

== Simple Groups

#defn[Simple Group][Group with no non-trivial proper normal subgroups.]
#thm[Abelian Simple Groups][Finite abelian is simple iff order is prime.]
#thm[Subgroups of $S_n$][If $H lt.eq S_n$ simple, $|H| > 2$, then $H subset.eq A_n$.]
#thm[Order $2m$ Non-simplicity][Group order $2m$ ($m > 1$ odd) is never simple.]
#prf[Embed in $S_(2m)$ via Cayley. Order 2 elt has no fixed pts, product of $m$ transpositions. $m$ odd -> odd perm. $G subset.not A_(2m)$, gives normal subgp index 2.]
#thm[Alternating Groups][$A_n$ is simple for $n gt.eq 5$.]
#thm[Index Bound][If $G$ is simple with proper subgroup of index $m > 1$, then $|G| | m!$.]
*$A_5$ is the only simple group of order 60* (up to isom).

*Non-simplicity Tests:* *Sylow Index:* $|G| = p^k m$ ($1 lt.eq m < p$, not $k=m=1$), $p$-Sylow has index $m < p$. Homomorphism into $S_m$, but assuming $G$ is simple (trivial kernel), $|G|$ cannot divide $m!$. *Order 36:* $w_3 in {1,4}$. If 4, action on Sylows gives index 4 subgp. Bound: $36 | 4! = 24$ (contradiction). *Order $p^2 q^2$ ($p > q$ odd):* $w_p in {1, q, q^2}$. $w_p eq.not q$. If $q^2$, $p | q^2 - 1 = (q-1)(q+1) => p = q+1$ (impossible). Thus $w_p = 1$. *Exactly 2-elt class:* implies not simple (centraliser index 2 is normal).

= Rings, Fields, Algebras

== Rings & Fields

#defn[Ring][$(R, +, times)$ abelian gp under $+$, semigroup under $times$, distributive. *Commutative*: $a b = b a$. *Unity*: exists $1$ s.t. $1 a = a 1 = a$. *Unit*: elt w/ mult. inverse. *Division Ring*: unity + all non-zero are units. *Field*: commutative division ring.]
#defn[Subring Test][Non-empty $S$ is subring if $a - b in S$ and $a b in S quad forall a,b$.]
#defn[Quaternions $HH$][$a + b i + c j + d k$, $i^2 = j^2 = k^2 = -1, i j = k, j k = i, k i = j$. Non-commutative.]
#thm[Quaternion Properties][$HH$ is non-commutative division ring. $q^(-1) = overline(q) / ||q||^2$ where $q = a+b i+c j+d k, overline(q) = a - b i - c j - d k, ||q|| = sqrt(a^2 + b^2 + c^2 + d^2)$.]
*Properties:* $overline(u v) = overline(v) overline(u), ||u v|| = ||u|| ||v||$.
#thm[Euler's Four-Square Identity][$(a^2+b^2+c^2+d^2)(e^2+f^2+g^2+h^2)$ is sum of 4 squares.]
*Wedderburn's Theorem:* Every finite division ring is a field.

== Ideals & Ring Decompositions

#defn[Ideals][$I$ is additive subgroup of $R$. *Left*: $r a in I$. *Right*: $a r in I$. *Two-sided*: both. *Simple* ring: no non-trivial proper two-sided ideals.]
#thm[Matrix Ring Simplicity][$M_n(D)$ is simple for any division ring $D$.]
#prf[$J$ contains $A$ w/ $a_(r s) eq.not 0$. Then $a_(r s)^(-1) E_(i r) A E_(s j) = E_(i j) in J$. $I_n in J => J = M_n(D)$.]
#defn[Idempotents][$e^2 = e$. *Central*: $e r = r e$. *Orthogonal*: $e f = f e = 0$. *Primitive*: cannot decompose as sum of two non-zero orthogonal idempotents.]
#thm[Idempotent Properties][In ring with unity $1$, $e^2 = e => (1-e)^2 = 1-e$, $e(1-e) = 0$.]
#thm[Ideals with Unity][If ideal $I$ has unity $e$, $e$ is central idempotent, $I = e R$.]
#thm[Ring Decomposition][If $R = I + J$ with $I inter J = {0}$, then $R tilde.eq I times J$.]
#thm[Idempotent Decomposition][For central idempotent $e$, $R = e R plus.o (1-e)R$.]

*Key Results:* $e R e$ is subring w/ unity $e$, $e R e = {a : e a = a e = a}$. $e + (1-e)r e$ always idempotent. $1 - 2e$ is self-inverse unit. In simple ring w/ unity, non-zero central elements are units.
*Examples:* $ZZ_(18)$: $9^2 = 9 => ZZ_(18) = 9 ZZ_(18) plus.o 10 ZZ_(18)$. $ZZ_(30)$ idempotents: ${0,1,6,10,15,16,21,25}$, decomp: $ZZ_(30) = 6 ZZ_(30) plus.o 10 ZZ_(30) plus.o 15 ZZ_(30)$.

== Algebras

#defn[$K$-Algebra][Vector space over $K$ w/ bilinear mult. Associative, has unity. *Division alg*: non-zero elts are units. *Subalg*, *Ideal*, *Simple* defined analogously to rings.]
*Examples:* $RR, CC$ division algebras over $RR$. $M_n(K)$ is $n^2$-dim. $HH$ 4-dim non-comm division algebra over $RR$.
#thm[Regular Representation][Every $n$-dim assoc algebra w/ unity over $K$ embeds in $M_n(K)$.]
#prf[Left mult $lambda_x : a |-> x a$. Map $theta: x |-> C_x$ (matrix of $lambda_x$) is injective homom.]
*Examples:* $CC$ over $RR$: $a + b i |-> mat(a, -b; b, a)$. Dual numbers: $a + b v |-> mat(a, 0; b, a)$.

#defn[Group Algebra $K G$][Finite group $G = {x_1, dots, x_n}$, field $K$, $K G = {sum a_i x_i | a_i in K}$ with mult extended from $G$ distributively, dim $n$.]
*Examples:* $|F_3 C_2| = 9$; $|F_2 S_3| = 64$; $op("dim") F_5 A_4 = 12$.

#thm[Maschke's Theorem (Partial)][Assuming $op("char")(K)$ doesn't divide $|G|$, $e = 1/|G| sum_(x in G) x$ is central primitive idempotent. $K G = e K G plus.o (1-e) K G$, $op("dim")_K (e K G) = 1$.]
#prf[_Idempotent:_ $x_i$ permutes $G => x_i e = e$. $e^2 = 1/n(x_1 e + dots + x_n e) = e$. _Primitive:_ $e = f_1 + f_2$, $f_1 f_2 = 0 => e f_i = f_i => f_i in e K G = op("span")({e}) => f_i = lambda_i e$. $lambda_1+lambda_2=1, lambda_1 lambda_2=0$, cannot decompose.]

*Group Algebra Properties:* #h(1em) *$K C_n$:* $g - 1$ is zero divisor: $(g-1)(1 + g + dots + g^(n-1)) = 0$. Never division algebra. #h(1em) *$F_2 C_3$:* 8 elts. $(1+g+g^2)$ idempotent, not unit. Non-zero elements under mult not a group. #h(1em) *$CC C_3$:* $f = 1/3(1 + omega g + omega^2 g^2)$ ($omega = e^(2 pi i / 3)$) is idempotent orthogonal to $e = 1/3(1+g+g^2)$.

== Key Techniques

*Order counting:* Elts of order $k$ come in groups of $phi(k)$ (from cyclic subgps). Non-cyclic order 55 has $4r$ elts of order 5, $10s$ of order 11, $4r + 10s = 54$. *Order 2 elements:* Even order group has odd \# of order 2 elts (non-self-inverse pair up). *Subgroup Intersections:* If $|H|^2 > |G|$ and $|J|^2 > |G|$, then $H inter J eq.not {e}$ since $|H inter J| = (|H||J|) \/ |H J| gt.eq (|H||J|) \/ |G| > 1$. *$S_n$ Generators:* Transpositions ${(1, i) : 2 lt.eq i lt.eq n}$ or ${(2, 3, dots, n), (1, 2)}$. *$A_n$ Generators:* Elts of $A_n$ ($n gt.eq 3$) product of 3-cycles. Identities (right-to-left): $(i, j)(i, k) = (i, k, j)$ and $(i, j)(k, ell) = (i, j, k)(j, k, ell)$. *$D_6$ Decomposition:* $D_6 tilde.eq D_3 times C_2$. *$A_4$ Subgroups:* No subgroup order 6. *Conjugacy Classes:* \# classes is $1/|G| sum_(g in G) |C_G(g)|$.

== Exam Strategies

*Sylow analysis:* $|G| = p^k m$. List divisors of $m$ $equiv 1 (mod p)$. Use element counting to eliminate trivial intersections. *Simple group test:* Index bounds ($|G| | m!$), Sylow uniqueness, union of classes, parity test ($2m$, $m$ odd). *Burnside applications:* List symmetries, compute number of cycles, apply formula. *Quotient identification:* 1st Isom Thm via homomorphism. *Ring decomposition:* Central idempotents $e_1, dots, e_k$ satisfy $sum e_i = 1$ and orthogonal ($e_i e_j = 0$). $R = e_1 R plus.o dots plus.o e_k R$.
