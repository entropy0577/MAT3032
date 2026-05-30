// MAT3032 Advanced Algebra — A4 Landscape Exam Notes
#set page(paper: "a4", flipped: true, margin: (top: 0.3cm, bottom: 0.3cm, left: 0.3cm, right: 0.3cm))
#set text(font: "FiraGo", size: 6.25pt, weight: "regular")
#set par(justify: true, leading: 0.25em, spacing: 0.15em)
#set heading(numbering: none)
#show heading.where(level: 1): set text(size: 7pt, weight: "bold")
#show heading.where(level: 2): set text(size: 7pt, weight: "bold")
#show heading.where(level: 3): set text(size: 7pt, weight: "bold")
#show heading: set block(above: 0.3em, below: 0.3em)
#set enum(indent: 0pt, body-indent: 2pt, spacing: 0.3em)
#set list(indent: 0pt, body-indent: 2pt, spacing: 0.3em)
#show: columns.with(4, gutter: 4pt)
#show math.equation: set text(font: "Fira Math")
#show math.equation.where(block: false): set text(bottom-edge: "bounds", top-edge: "bounds")

#let thm(title, body) = block(
  width: 100%, inset: (x: 2pt, y: 1.5pt), radius: 1pt,
  stroke: 0.3pt + luma(120), fill: luma(245),
  [*#title.* #body]
)
#let defn(title, body) = block(
  width: 100%, inset: (x: 2pt, y: 1.5pt), radius: 1pt,
  stroke: 0.3pt + rgb("#2563eb"), fill: rgb("#eff6ff"),
  [*#title.* #body]
)
#let prf(body) = block(
  width: 100%, inset: (x: 2pt, y: 1pt), radius: 1pt,
  stroke: 0.3pt + rgb("#9333ea"), fill: rgb("#faf5ff"),
  [_Pf._ #body]
)

= Ch 1: Groups

== §1.1 Fundamentals

#defn[Group][$( G, ast )$: set w/ assoc. binary op, identity $e$, inverses. *Abelian*: commutative.]
#defn[Subgroup Test][$H lt.eq G$ iff $a b^(-1) in H$ $forall a, b in H$.]
#thm[Lagrange][$H lt.eq G$, $G$ finite $=>$ $|H|$ divides $|G|$. Index $[G:H] = |G|\/|H|$.]
#defn[Element Order][$o(a)$ = smallest $k in NN$ s.t. $a^k = e$; $o(a) | |G|$.]
#defn[Homomorphism][$phi: G_1 -> G_2$ preserving op. *Kernel*: $ker phi = {g : phi(g) = e}$. *Image*: $phi(G_1)$. Injective iff $ker phi = {e}$.]

*Group families:*
- *Cyclic* $C_n = chevron.l g : g^n = e chevron.r tilde.eq (ZZ_n, +_n)$; $phi(n)$ generators; unique subgp of order $d$ for each $d | n$
- *Units* $U_n$: units of $(ZZ_n, times_n)$, order $phi(n)$
- *$"GL"(n,R)$, $"SL"(n,R)$*: general/special linear groups
- *$S_n$*: symmetric group, order $n!$; cycle notation; *$A_n$*: alternating, order $n!\/2$
- *$D_n$*: dihedral, symmetries of regular $n$-gon, order $2n$
- *Direct products*: $C_m times C_n tilde.eq C_(m n)$ iff $gcd(m,n) = 1$

== §1.2 Generators & Presentations

#defn[Generating Set][$chevron.l S chevron.r$ = smallest subgroup containing $S$.]
#defn[Presentation][$chevron.l S : R chevron.r$: generators and defining relations.]
Examples: $C_n = chevron.l g : g^n = e chevron.r$; Klein $V = chevron.l a,b : a^2 = b^2 = e, a b a = b chevron.r$; $D_n = chevron.l sigma, tau : sigma^n = tau^2 = iota, sigma tau sigma = tau chevron.r$.

*Groups of order 8:* 5 total: $C_8$, $C_4 times C_2$, $C_2^3$ (abelian); $D_4$, $Q_4$ (non-abelian).
_Derivation:_ Non-abelian of order 8: all non-id elements have order 2 or 4; at least one has order 4 (else abelian). Pick $a$ of order 4, $b in.not chevron.l a chevron.r$. Then $G = {e, a, a^2, a^3, b, a b, a^2 b, a^3 b}$. Since $b^2 in chevron.l a chevron.r$: $b^2 = e => D_4$; $b^2 = a^2 => Q_4$.

#defn[Dicyclic][$Q_n$: order $2n$, $chevron.l a,b : a^n = e, b^2 = a^(n\/2), a b a = b chevron.r$.]

== §1.3 Cosets, Products, Quotients

#defn[Cosets][Left $a H = {a h : h in H}$, right $H a$. Cosets partition $G$.]
#defn[Normal][$H lt.tri.eq G$: $a H = H a$ $forall a$. Equiv: $a H a^(-1) = H$ $forall a$. Index 2 $=>$ normal. Kernels are normal.]
#thm[Prop 1.1][Check normality via generators: $H lt.tri.eq G$ iff $g h g^(-1) in H$ for all $g$ in gen. set for $G$, $h$ in gen. set for $H$.]
#thm[Prop 1.2][$(b a b^(-1))^n = b a^n b^(-1)$; if $b a b^(-1) = a^r$ then $b^n a b^(-n) = a^(r^n)$.]
#thm[Prop 1.3][(i) $H J$ is subgroup iff $J H = H J$. (ii) $H lt.tri.eq G$ or $J lt.tri.eq G => H J lt.eq G$. (iii) Both normal $=> H J lt.tri.eq G$.]
#prf[(i): If $H J lt.eq G$, $h^(-1)j^(-1) in H J$ so $(h^(-1)j^(-1))^(-1) = j h in H J$, thus $J H subset.eq H J$; similarly reverse. Converse: subgroup test with $J H = H J$.]
#thm[Prop 1.4][$|H J| = (|H| dot |J|) / |H inter J|$.]
#thm[Prop 1.5 (Internal Direct Product)][If $G = H J$, $H inter J = {e}$: (i) unique $h j$ expression; (ii) $H, J lt.tri.eq G$ iff $h j = j h$ $forall h,j$; then $G tilde.eq H times J$.]
#prf[Uniqueness: $h j = h' j' => h'^(-1) h = j' j^(-1) in H inter J = {e}$. Commutativity$<=>$normality: if both normal, $h j h^(-1) j^(-1) in H inter J = {e}$.]

#defn[Quotient Group][$G\/H$ when $H lt.tri.eq G$: cosets $a H$ form group, $(a H)(b H) = a b H$.]
#thm[1st Isomorphism Thm][$phi: G_1 -> G_2$ homom. $=>$ $ker phi lt.tri.eq G_1$ and $G_1 \/ ker phi tilde.eq phi(G_1)$.]
#thm[Prop 1.7 (Correspondence Thm)][Subgroups of $G\/N$ are $H\/N$ for $H lt.eq G$ with $N lt.eq H$. $H\/N lt.tri.eq G\/N$ iff $N lt.tri.eq H lt.tri.eq G$, and $(G\/N)\/(H\/N) tilde.eq G\/H$ (*3rd Isom. Thm*).]
#thm[2nd Isomorphism Thm][$H\/(H inter N) tilde.eq H N\/N$.]
#thm[Prop 1.8][If $G\/N$ cyclic, then $G$ has a subgroup $tilde.eq G\/N$.]
#prf[If $g N$ generates $G\/N$ with order $m$, $g$ has order $r = k m$. Then $chevron.l g^k chevron.r tilde.eq G\/N$.]

== §1.4 Finite Abelian Groups

#thm[Fundamental Theorem][Every finite abelian group $tilde.eq$ direct product of cyclics:
(1) *Primary:* $C_(p_1^(n_1)) times dots times C_(p_r^(n_r))$;
(2) *Invariant factor:* $C_(q_1) times dots times C_(q_s)$ with $q_i | q_(i+1)$.]
#prf[Induction on min. generating set size. Key: if $chevron.l g_1 chevron.r inter H eq.not {e}$, construct element of smaller order in a $k$-element gen. set, contradicting minimality.]

Examples: Order 54: $C_54$, $C_3 times C_18$, $C_3^2 times C_6$. Number of abelian groups of order $p^k$ = partitions of $k$.
*Elem. order:* $o((g_1, ..., g_s))$ is $lcm(o(g_1), ..., o(g_s))$. *Prop 1.9:* Ab. gp w/ gen. set gcd=1 has $k$-elt gen. set with product of powers.

== §1.5 Automorphisms & Semi-Direct Products

#thm[Prop 1.11][$"Aut"(C_n) tilde.eq U_n$, $|"Aut"(C_n)| = phi(n)$. Automorphisms: $psi_m : g |-> g^m$ for $gcd(m,n) = 1$.]
#defn[Inner Auts][$gamma_a : x |-> a x a^(-1)$; $"Inn"(G) lt.tri.eq "Aut"(G)$; $G\/Z(G) tilde.eq "Inn"(G)$.]
#defn[Semi-Direct Product][$H times.r J$: $G = H J$, $H inter J = {e}$, $H lt.tri.eq G$ (but $J$ need not be normal). $J$ acts on $H$ by conjugation.]

*Groups of order 12:* $H tilde.eq C_3$, $J tilde.eq C_4$, $H lt.tri.eq G$: conjugation by $j$ maps $h -> h$ (gives $C_12$) or $h -> h^2$ (non-abelian).
*Char. subgroups:* Transitive. If $N lt.tri.eq G$, $G\/N$ cyclic, $|N|, |G\/N|$ coprime $=> G = N times.r Q$.
*Homom/Aut:* $phi(a)=a^2$ homom iff abelian. $"Aut"(ZZ) tilde.eq C_2$.

= Ch 2: Actions, Conjugacy, Sylow

== §2.1 Group Actions

#defn[Left Action][$(g,x) |-> g(x) in X$ with $e(x) = x$ and $g_1(g_2(x)) = (g_1 g_2)(x)$.]
#defn[Orbit/Stabiliser][$O(x) = {g(x) : g in G}$; $G_x = {g : g(x) = x} lt.eq G$; $"Fix"(g) = {x : g(x) = x}$.]
#thm[Orbit-Stabiliser (Prop 2.2)][Bijection $g(x) <-> g G_x$. For finite $G$: $|O(x)| dot |G_x| = |G|$.]
#prf[$h(x) = g(x) <==> g^(-1)h in G_x <==> h in g G_x$.]
#thm[Orbit Decomposition (Prop 2.3)][$|X| = |"Fix"(G)| + sum_(i=1)^n [G:G_(x_i)]$ (sum over non-trivial orbit reps).]
#thm[Prop 2.4][Action on set of size $m$ $=>$ homomorphism $G -> S_m$ with kernel $tilde(G)_X$.]
#thm[Prop 2.5][Subgroup of index $m$ $=>$ homom. $G -> S_m$ with kernel $subset.eq$ the subgroup.]
#thm[Cayley (Prop 2.6)][Every group of order $n$ embeds in $S_n$.]
*Transitive:* $O(x) = X$. (e.g. $(RR, +)$ acting on $CC$ via $x(z) = e^(i x)z$).
#thm[Prop 2.7][If $p$ is smallest prime dividing $|G|$, any subgroup of index $p$ is normal.]
#prf[Homom. $G -> S_p$, image divides $p!$ and $|G|$. Since primes of $|G|$ are $gt.eq p$, $|G\/K| = p$, forcing $K = H$.]
#thm[Prop 2.8][Every group of order $p^2$ is abelian ($tilde.eq C_(p^2)$ or $C_p times C_p$).]

== §2.2 Conjugacy

#defn[Conjugacy Class][$x^G = {g x g^(-1) : g in G}$ (orbit under conjugation).]
#defn[Centraliser/Centre][$C_G(x) = {g : g x = x g}$; $Z(G) = {g : g x = x g space forall x} lt.tri.eq G$.]
#thm[Class Equation][$|G| = |Z(G)| + sum_(x in T) |G|\/|C_G(x)|$.]
#thm[Cauchy (Prop 2.10)][If $p | |G|$, $exists$ element of order $p$.]
#prf[Abelian: decompose, find factor with $p | "order"$. Non-abelian: if $p | [G:C_G(x)]$ for all $x in T$, then $p | |Z(G)|$ (abelian case). Else $p | |C_G(x)|$ for some $x$ with $|C_G(x)| < |G|$; induction.]
#thm[Prop 2.11][If $G$ non-abelian, $G\/Z(G)$ is not cyclic.]
#thm[Prop 2.9][$Z(G)$ is union of 1-elt conj classes. $|Z(G)| lt.eq |G|\/4$ for non-abelian.]
*Conjugates:* $G$ is never a union of conjugates of a proper subgroup.
#thm[Prop 2.12][$H lt.tri.eq G$ iff $H$ is a union of conjugacy classes.]
#defn[Normaliser][$N_G(H) = {g : g H = H g}$; $H lt.tri.eq N_G(H)$; \#conjugates of $H$ = $[G : N_G(H)]$.]

== §2.3 Conjugacy in $S_n$

#defn[Cycle Type][$1^(m_1) 2^(m_2) dots n^(m_n)$ where $m_i$ = \#$i$-cycles. *Cycle index*: $"cyc"(sigma) = sum m_i$.]
#thm[Prop 2.14][$pi rho pi^(-1) = (pi(i_1) space pi(i_2) dots pi(i_k))$ for $rho = (i_1 space i_2 dots i_k)$.]
#thm[Prop 2.15][Conjugate in $S_n$ $<==>$ same cycle type.]
#thm[Prop 2.16][Conj. class size: $n! \/ (1^(m_1) 2^(m_2) dots n^(m_n) m_1! dots m_n!)$. Centraliser order: $1^(m_1) 2^(m_2) dots n^(m_n) m_1! dots m_n!$.]
#thm[Prop 2.13][$H lt.eq S_n => H subset.eq A_n$ or $|H inter A_n| = |H|\/2$.]
*Conjugacy in $A_n$*: $S_n$-class stays single in $A_n$ or splits into two equal halves. *$A_5$ is simple:* class sizes 1, 12, 12, 15, 20; no non-trivial union divides 60.
*$k$-cycle is even iff $k$ odd.* $sigma$ even iff $n - "cyc"(sigma)$ even. \#$k$-cycles in $S_n$: $binom(n,k)(k-1)!$
$(1 space 2 space 3)$ and $(1 space 3 space 2)$ NOT conjugate in $A_4$ (conjugating $pi$ must be odd).
$S_4$ normal subgroups: ${e}$, $V = {e, (12)(34), (13)(24), (14)(23)}$, $A_4$, $S_4$.

== §2.4 Burnside's Formula

#thm[Burnside (Prop 2.17)][\#orbits $= 1/(|G|) sum_(g in G) |"Fix"(g)|$.]
#prf[Count pairs $(g,x)$ with $g(x) = x$ two ways: $sum |"Fix"(g)| = sum |G_x|$. By orbit-stabiliser, each orbit contributes 1.]
#thm[Colouring Formula (Prop 2.18)][$q$ colours, symmetry $G subset.eq S_n$: \#colourings $= 1/(|G|) sum_(sigma in G) q^("cyc"(sigma))$.]
*Hexagon, 3 colours:* Rotations ($C_6$): $1/6(3^6 + 2 dot 3 + 2 dot 9 + 27) = 130$. Full ($D_6$): $1/12(3^6 + 2 dot 3 + 2 dot 9 + 27 + 3 dot 81 + 3 dot 27) = 92$.
*Pentagon:* $C_5$: $1/5(q^5 + 4q)$; $D_5$: $1/10(q^5 + 4q + 5q^3)$.
*Tetrahedron faces, 4 colours ($A_4$):* $1/12(4^4 + 8 dot 4 + 3 dot 4^2) = 36$.
*Octahedron (24 syms):* 24 symmetries; $q$-colourings = $1/24(q^8 + 17q^4 + 6q^2)$.

== §2.5 $p$-Groups & Sylow Theorems

#thm[Prop 2.19][$p$-group on finite $X$: $|"Fix"(G)| equiv |X| (mod p)$. So $Z(G) eq.not {e}$.]
#thm[Prop 2.20][$p$-subgroup $H$: $[N_G(H):H] equiv [G:H] (mod p)$.]
#thm[Sylow Theorems (Prop 2.21)][$|G| = p^k m$, $p divides.not m$:
(i) $exists$ $p$-Sylow (order $p^k$); (ii) every $p$-subgroup $subset.eq$ some $p$-Sylow; (iii) all $p$-Sylows conjugate; (iv) $w_p equiv 1 (mod p)$ and $w_p | m$; (v) $[G:N_G(P)] = w_p$.]
#prf[(i)+(ii): Start with $|H| = p$ (Cauchy). Prop 2.20 gives $p | [N_G(H):H]$ for proper $p$-subgp, so $exists$ larger one by Correspondence Thm.
(iii): $P'$ acts on $G\/P$; $|"Fix"(P')| equiv m (mod p) eq.not 0$, so $exists b P$ fixed by $P'$, giving $P' subset.eq b P b^(-1)$; equal order $=> P' = b P b^(-1)$.
(iv): $w_p = [G:N_G(P)]$; $q = [N_G(P):P]$; $q w_p = m$ so $w_p | m$. By 2.20, $m = q + k p$ so $w_p = 1 + k p\/q$; $p divides.not q$ gives $w_p equiv 1 (mod p)$.]

#thm[Prop 2.22][(i) Unique $p$-Sylow $<==>$ normal. (ii) Abelian $=>$ unique $p$-Sylows. (iii) All unique $=>$ $G tilde.eq$ direct product of Sylows.]
#thm[Prop 2.23 (Order $p q$)][Primes $p > q$: abelian $=>$ cyclic $C_(p q)$. Non-abelian exists iff $q | (p-1)$; then unique up to isom., $w_p = 1$, $w_q = p$.]
#thm[Prop 2.24][If $H lt.tri.eq G$ cyclic and $phi(|H|)$ coprime to $|J|$, then $h j = j h$ $forall h,j$. If $phi(|H|)$ coprime to $|G|$ then $H subset.eq Z(G)$.]
#prf[$theta: J -> "Aut"(H)$ by $j |-> gamma_j$. $|"Aut"(H)| = phi(|H|)$ coprime to $|J|$ $=> |theta(J)| = 1$.]

*Key Sylow examples:*
Order 133 ($= 7 times 19$): $w_19 = 1$, $w_7 = 1$, both normal, $G tilde.eq C_133$.
Order 45 ($= 3^2 times 5$): $w_5 = 1$, $w_3 = 1$; groups: $C_45$, $C_3 times C_15$.
Order 455 ($= 5 times 7 times 13$): $w_13 = 1$, $w_7 = 1$, $w_5 = 1$; $G tilde.eq C_455$.

== §2.6 Simple Groups

#defn[Simple][No non-trivial proper normal subgroups.]
#thm[Prop 2.25][Finite abelian group is simple iff order is prime.]
#thm[Prop 2.26][If $H lt.eq S_n$ simple, $|H| > 2$, then $H subset.eq A_n$.]
#thm[Prop 2.27][Order $2m$ ($m$ odd, $m > 1$): not simple.]
#prf[Embed in $S_(2m)$; element of order 2 is product of $m$ (odd) transpositions, hence odd. Not in $A_(2m)$, so not simple by 2.26.]
#thm[Prop 2.28][$A_n$ is simple for $n gt.eq 5$.]
#prf[Base $A_5$: class sizes 1,12,12,15,20; no non-trivial union divides 60. Induction using $A_(n-1)$.]
#thm[Prop 2.29][If $G$ simple with subgroup of index $m$, then $|G| | m!$.]
*$A_5$ is the only simple group of order 60* (up to isom.).

*Non-simplicity tests:*
$|G| = p^k m$ with $1 lt.eq m < p$, not both $k = m = 1$: $p$-Sylow has index $< p$, contradicts $|G| | m!$.
Order $36$: $w_3 in {1,4}$; if $4$ then $36 | 4! = 24$, contradiction.
Order $p^2 q^2$ ($p > q$ odd): $w_p = 1$ (forced).
Order $2m$ ($m$ odd $> 1$): never simple.
*Exactly 2-elt conj class:* implies not simple. Max subgroup order bounds apply (e.g. 1092 has max 84).

= Ch 3: Rings, Fields, Algebras

== §3.1 Rings & Fields

#defn[Ring][$(R, +, times)$: abelian group under $+$, semigroup under $times$, distributive.]
#defn[Subring Test][$a - b in S$ and $a b in S$ $forall a,b in S$.]
#defn[Quaternions $HH$][$a + b i + c j + d k$, $i^2 = j^2 = k^2 = -1$, $i j = k$, $j k = i$, $k i = j$; anti-commutative ($j i = -k$ etc.).]
#thm[Prop 3.1][$HH$ is non-commutative division ring. $u^(-1) = overline(u) \/ ||u||^2$ where $overline(u) = a - b i - c j - d k$, $||u|| = sqrt(a^2 + b^2 + c^2 + d^2)$.]
*Properties:* $overline(u v) = overline(v) overline(u)$; $||u v|| = ||u|| dot ||v||$.
#thm[Euler's Four-Square (Prop 3.2)][$(a^2+b^2+c^2+d^2)(e^2+f^2+g^2+h^2)$ is a sum of 4 squares.]
*Wedderburn's Theorem:* Every finite division ring is a field.

== §3.2 Ideals & Ring Decompositions

#defn[Ideals][Left: $r a in I$; right: $a r in I$; two-sided: both. *Simple ring*: no non-trivial proper two-sided ideals.]
#thm[Prop 3.3][$M_n(D)$ is simple for any division ring $D$.]
#prf[Non-zero $A in J$ has $a_(r s) eq.not 0$ (invertible). $a_(r s)^(-1) E_(i r) A E_(s j) = E_(i j)$, so all $E_(i j) in J$, $I_n in J$, $J = M_n(D)$.]
#defn[Idempotents][$e^2 = e$. *Central*: $e r = r e$ $forall r$. *Orthogonal*: $e f = f e = 0$. *Primitive*: can't decompose as sum of two non-zero orthogonal idempotents.]
#thm[Prop 3.4][$e$ idempotent $=> 1 - e$ idempotent, and $e(1-e) = 0$.]
#thm[Prop 3.5][If ideal $I$ has unity $e$, then $e$ is central idempotent, $I = e R$.]
#thm[Prop 3.6][If $R = I + J$, $I inter J = {0}$, then $R tilde.eq I times J$.]
#thm[Prop 3.7][Central idempotent $e$: $R = e R plus.o (1-e)R$.]

*Key results:* $e R e$ is subring with unity $e$; $e R e = {a : e a = a e = a}$. $e + (1-e)r e$ is idempotent. $1 - 2e$ is self-inverse unit.
$ZZ_18$: $9^2 = 9$; $ZZ_18 = 9 ZZ_18 plus.o 10 ZZ_18$.
$ZZ_30$ idempotents: ${0,1,6,10,15,16,21,25}$; decomp: $ZZ_30 = 6 ZZ_30 plus.o 10 ZZ_30 plus.o 15 ZZ_30$.
In simple ring with unity, every non-zero central element is a unit.

== §3.3 Algebras

#defn[$K$-Algebra][$A$: vector space over $K$ with bilinear multiplication. Associative, with unity.]
Examples: $RR$, $CC$: division algebras over $RR$; $M_n(K)$: $n^2$-dim; $HH$: 4-dim non-commutative division algebra over $RR$.
#thm[Regular Representation (Prop 3.8)][Every $n$-dim assoc. algebra with unity over $K$ embeds in $M_n(K)$.]
#prf[Define $lambda_x : a |-> x a$. Map $theta: x |-> C_x$ (matrix of $lambda_x$) is injective algebra homomorphism.]
*Regular rep examples:* $CC$ over $RR$: $a + b i |-> mat(a, -b; b, a)$. Dual numbers: $a + b v |-> mat(a, 0; b, a)$.

#defn[Group Algebra $K G$][For finite $G = {x_1, dots, x_n}$, field $K$: $K G = {sum a_i x_i}$, dim $= n$.]
$|F_3 C_2| = 9$; $|F_2 S_3| = 64$; $dim F_5 A_4 = 12$.
#thm[Prop 3.9][$e = 1/(|G|) sum_(x in G) x$ is a central primitive idempotent. $K G = e K G plus.o (1-e) K G$; $dim_K(e K G) = 1$.]
#prf[$x_i e = e$ (since $x_i$ permutes $G$). $e^2 = 1/n(x_1 e + dots + x_n e) = e$. $e K G = "span"{e}$, dim 1.]
#prf[Primitive: if $e = f_1 + f_2$, $f_1 f_2 = 0$, then $e f_i = f_i$ forces $f_i in e K G = "span"{e}$, so $f_i = lambda_i e$; $lambda_1 + lambda_2 = 1$, $lambda_1 lambda_2 = 0$.]

*$K C_n$:* $g - 1$ is zero divisor: $(g-1)(1 + g + dots + g^(n-1)) = 0$. So $K C_n$ is not a division algebra.

*$F_2 C_3$:* 8 elements; $(1+g+g^2)^2 = 1+g+g^2$ (idempotent, not unit), so $(F_2 C_3)^*$ is not a group.
*$CC C_3$:* $f = 1/3(1 + omega g + omega^2 g^2)$ ($omega = e^(2 pi i\/3)$) is idempotent, orthogonal to $e = 1/3(1+g+g^2)$.

== Key Techniques

*Order counting:* Elements of order $k$ come in groups of $phi(k)$ (from cyclic subgroups). E.g., order 55 non-cyclic: $2r + 5s = 27$.
*Even order has odd \# elements of order 2:* pair non-self-inverse elements.
*If $|H|^2 > |G|$ and $|J|^2 > |G|$: $H inter J eq.not {e}$.*
*$S_n$ generated by:* ${(1 space i) : 2 lt.eq i lt.eq n}$ or ${(2 space 3 dots n), (1 space 2)}$.
*Every element of $A_n$ ($n gt.eq 3$):* product of 3-cycles. $(i j)(i k) = (i k j)$; $(i j)(k ell) = (i j k)(j k ell)$.
*$D_6 tilde.eq D_3 times C_2$.*
*$A_4$ has no subgroup of order 6.*
*\#conj. classes = $1/(|G|) sum |C_G(g)|$.*

== Exam Strategies

*Sylow analysis:* Write $|G| = p^k m$; list divisors of $m$ that are $equiv 1 (mod p)$; use element counting to eliminate cases.
*Simple group test:* Check index arguments ($|G| | m!$), Sylow uniqueness, conjugacy class unions, order $2m$ ($m$ odd).
*Burnside:* List symmetries, compute cycle index of each, apply formula.
*Quotient identification:* Use 1st Isom. Thm; find kernel and image.
*Ring decomposition:* Find central idempotents $e_1, dots, e_k$ with $sum e_i = 1$, pairwise orthogonal; $R = e_1 R plus.o dots plus.o e_k R$.
