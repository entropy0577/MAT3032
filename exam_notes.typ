// MAT3032 Advanced Algebra — Study Guide
#set page(paper: "a4", margin: (top: 2cm, bottom: 2cm, left: 1.5cm, right: 1.5cm))
#set text(font: "New Computer Modern", size: 10pt, weight: "regular")
#set par(justify: false, leading: 0.5em, spacing: 0.5em)
#set heading(numbering: "1.1")
#show heading.where(level: 1): set text(size: 14pt, weight: "bold")
#show heading.where(level: 2): set text(size: 12pt, weight: "bold")
#show heading.where(level: 3): set text(size: 11pt, weight: "bold")
#show heading: set block(above: 1.2em, below: 0.8em)
#set enum(indent: 0pt, body-indent: 4pt, spacing: 0.5em)
#set list(indent: 0pt, body-indent: 4pt, spacing: 0.5em)
#show: columns.with(2, gutter: 1cm)
#show math.equation: set text(font: "New Computer Modern Math")
#show math.equation.where(block: false): set text(bottom-edge: "bounds", top-edge: "bounds")

#let thm(title, body) = block(
  width: 100%, inset: (x: 6pt, y: 4pt), radius: 2pt,
  stroke: 0.5pt + luma(120), fill: luma(245),
  [*#title.* #body]
)
#let defn(title, body) = block(
  width: 100%, inset: (x: 6pt, y: 4pt), radius: 2pt,
  stroke: 0.5pt + rgb("#2563eb"), fill: rgb("#eff6ff"),
  [*#title.* #body]
)
#let prf(body) = block(
  width: 100%, inset: (x: 6pt, y: 4pt), radius: 2pt,
  stroke: 0.5pt + rgb("#9333ea"), fill: rgb("#faf5ff"),
  [_Proof._ #body]
)

= Groups

== Fundamentals

#defn[Group][$(G, ast)$ is a set with an associative binary operation, an identity element $e$, and inverses. It is *Abelian* if the operation is commutative.]
#defn[Subgroup Test][For a non-empty subset $H subset.eq G$, $H lt.eq G$ if and only if $a b^(-1) in H$ for all $a, b in H$.]
#thm[Lagrange's Theorem][If $H lt.eq G$ and $G$ is finite, then $|H|$ divides $|G|$. The index $[G:H] = |G| \/ |H|$.]
#defn[Element Order][The order of $a$, denoted $o(a)$, is the smallest $k in NN^+$ such that $a^k = e$. Note: By Lagrange's Theorem, $o(a)$ divides $|G|$.]
#defn[Homomorphism][A map $phi: G_1 -> G_2$ preserving the group operation. 
- *Kernel*: $ker phi = {g : phi(g) = e}$. 
- *Image*: $phi(G_1)$. 
A homomorphism is injective if and only if $ker phi = {e}$.]

*Group Families:*
- *Cyclic* $C_n = chevron.l g : g^n = e chevron.r tilde.eq (ZZ_n, +_n)$; there are $phi(n)$ generators; there is a unique subgroup of order $d$ for each $d | n$.
- *Units* $U_n$: units of $(ZZ_n, times_n)$, order $phi(n)$.
- *$"GL"(n,R)$, $"SL"(n,R)$*: general and special linear groups.
- *$S_n$*: symmetric group, order $n!$; *$A_n$*: alternating group, order $n! \/ 2$.
- *$D_n$*: dihedral group, symmetries of a regular $n$-gon, order $2n$.
- *Direct products*: $C_m times C_n tilde.eq C_(m n)$ if and only if $gcd(m,n) = 1$.

== Generators & Presentations

#defn[Generating Set][$chevron.l S chevron.r$ is the smallest subgroup containing $S$.]
#defn[Presentation][$chevron.l S | R chevron.r$ denotes a group with generators $S$ and defining relations $R$.]

*Examples:* 
- $C_n = chevron.l g | g^n = e chevron.r$
- Klein Four-Group $V = chevron.l a,b | a^2 = b^2 = e, a b a = b chevron.r$
- $D_n = chevron.l sigma, tau | sigma^n = tau^2 = iota, sigma tau sigma = tau chevron.r$

*Groups of order 8:* There are 5 total: $C_8$, $C_4 times C_2$, $C_2^3$ (abelian); $D_4$, $Q_4$ (non-abelian).
_Derivation:_ For a non-abelian group of order 8, all non-identity elements have order 2 or 4. At least one element must have order 4 (otherwise the group is abelian). Pick $a$ of order 4, and $b in.not chevron.l a chevron.r$. Then $G = {e, a, a^2, a^3, b, a b, a^2 b, a^3 b}$. Since $b^2 in chevron.l a chevron.r$ and commutes with $b$, $b^2$ must be $e$ or $a^2$. We must also establish the conjugation relation $b a b^(-1) = a^(-1)$ (or $b a = a^3 b$) to ensure the group is non-abelian. If $b^2 = e$, the presentation matches $D_4$. If $b^2 = a^2$, it matches $Q_4$.

#defn[Dicyclic Group][$Q_n$: order $2n$, presentation $chevron.l a,b | a^n = e, b^2 = a^(n\/2), a b a = b chevron.r$.]

== Cosets, Products, Quotients

#defn[Cosets][A left coset is $a H = {a h : h in H}$, a right coset is $H a$. Cosets partition $G$.]
#defn[Normal Subgroup][$H lt.tri.eq G$ if $a H = H a$ for all $a in G$. Equivalent definition: $a H a^(-1) = H$ for all $a in G$. Any subgroup of index 2 is normal. Kernels of homomorphisms are always normal.]
#thm[Normality via Generators][For a finite group $G$ (or if checking both generators and their inverses), $H lt.tri.eq G$ if and only if $g h g^(-1) in H$ for all $g$ in a generating set for $G$, and all $h$ in a generating set for $H$.]
#thm[Conjugation Power Rule][$(b a b^(-1))^n = b a^n b^(-1)$; if $b a b^(-1) = a^r$ then $b^n a b^(-n) = a^(r^n)$.]
#thm[Subgroup Product Theorem][
- $H J$ is a subgroup if and only if $J H = H J$. 
- If $H lt.tri.eq G$ or $J lt.tri.eq G$, then $H J lt.eq G$. 
- If both $H lt.tri.eq G$ and $J lt.tri.eq G$, then $H J lt.tri.eq G$.]
#prf[For the first point: If $H J lt.eq G$, then for any $h in H, j in J$, we have $h^(-1)j^(-1) in H J$, so their inverse $(h^(-1)j^(-1))^(-1) = j h in H J$, meaning $J H subset.eq H J$. A similar argument shows $H J subset.eq J H$. The converse follows from the subgroup test since $J H = H J$.]
#thm[Product Order][$|H J| = (|H| dot |J|) / |H inter J|$.]
#thm[Internal Direct Product][If $G = H J$ and $H inter J = {e}$: 
- Every element has a unique expression $h j$. 
- $H, J lt.tri.eq G$ if and only if $h j = j h$ for all $h in H, j in J$. In this case, $G tilde.eq H times J$.]
#prf[Uniqueness: If $h j = h' j'$, then $(h')^(-1) h = j' j^(-1)$. This element is in $H inter J = {e}$. 
Commutativity $<=>$ normality: If both are normal, the commutator $h j h^(-1) j^(-1) = (h j h^(-1)) j^(-1) = h (j h^(-1) j^(-1)) in H inter J = {e}$, meaning $h j = j h$. Conversely, if they commute, conjugation is trivial and normality follows immediately.]

#defn[Quotient Group][$G\/H$ exists when $H lt.tri.eq G$. The cosets $a H$ form a group under the operation $(a H)(b H) = a b H$.]
#thm[1st Isomorphism Theorem][If $phi: G_1 -> G_2$ is a homomorphism, then $ker phi lt.tri.eq G_1$ and $G_1 \/ ker phi tilde.eq phi(G_1)$.]
#thm[Correspondence Theorem][The subgroups of $G\/N$ are exactly those of the form $H\/N$ for $H lt.eq G$ containing $N$. Furthermore, assuming $N lt.tri.eq G$, $H\/N lt.tri.eq G\/N <=> H lt.tri.eq G$, and $(G\/N)\/(H\/N) tilde.eq G\/H$ (which is the *3rd Isomorphism Theorem*).]
#thm[2nd Isomorphism Theorem][If $H lt.eq G$ and $N lt.tri.eq G$, then $H\/(H inter N) tilde.eq H N\/N$.]
#thm[Quotient Subgroups][If $G$ is a finite group and $G\/N$ is cyclic, then $G$ has a subgroup isomorphic to $G\/N$.]
#prf[If $g N$ generates $G\/N$ with order $m$, then $g$ has order $r = k m$. The subgroup $chevron.l g^k chevron.r$ is isomorphic to $G\/N$.]

== Finite Abelian Groups

#thm[Fundamental Theorem of Finite Abelian Groups][Every finite abelian group is isomorphic to a direct product of cyclic groups:
- *Primary Decomposition:* $C_(p_1^(n_1)) times dots times C_(p_r^(n_r))$
- *Invariant Factor Decomposition:* $C_(q_1) times dots times C_(q_s)$ with $q_i | q_(i+1)$.]
#prf[The proof proceeds by induction on the minimal size of a generating set. A key step involves showing that if $chevron.l g_1 chevron.r inter H eq.not {e}$, one can construct an element to replace a generator such that the orders of the new generating elements contradict the maximality/minimality assumptions, completing the induction.]

*Examples:* For order 54, the abelian groups are $C_54$, $C_3 times C_18$, $C_3^2 times C_6$. The number of abelian groups of order $p^k$ is equal to the number of partitions of $k$.
*Element order:* The order of $(g_1, dots, g_s)$ is $"lcm"(o(g_1), dots, o(g_s))$. 
*Generating Sets:* An abelian group generated by elements with coprime orders has a generating set formed by products of prime powers.

== Automorphisms & Semi-Direct Products

#thm[Automorphism Group of $C_n$][$"Aut"(C_n) tilde.eq U_n$, so $|"Aut"(C_n)| = phi(n)$. The automorphisms are given by $psi_m : g |-> g^m$ for $gcd(m,n) = 1$.]
#defn[Inner Automorphisms][Defined by conjugation $gamma_a : x |-> a x a^(-1)$. $"Inn"(G) lt.tri.eq "Aut"(G)$, and $G\/Z(G) tilde.eq "Inn"(G)$.]
#defn[Semi-Direct Product][$H times.r J$ occurs when $G = H J$, $H inter J = {e}$, and $H lt.tri.eq G$ (but $J$ need not be normal). $J$ acts on $H$ by conjugation.]

*Groups of order 12:* Let $H tilde.eq C_3$ and $J tilde.eq C_4$ with $H lt.tri.eq G$. Conjugation by $j in J$ maps $h |-> h$ (yielding the abelian $C_12$) or $h |-> h^2$ (yielding a non-abelian group).
*Characteristic subgroups:* The property is transitive ($K "char" H "char" G => K "char" G$). If $N lt.tri.eq G$, $G\/N$ is cyclic, and $|N|, |G\/N|$ are coprime, then $G = N times.r Q$ (where $Q lt.eq G$ and $Q tilde.eq G\/N$).
*Homomorphism vs Automorphism:* $phi(a)=a^2$ is a homomorphism if and only if $G$ is abelian. $"Aut"(ZZ) tilde.eq C_2$.

= Actions, Conjugacy, Sylow

== Group Actions

#defn[Left Action][A map $(g,x) |-> g(x) in X$ with $e(x) = x$ and $g_1(g_2(x)) = (g_1 g_2)(x)$.]
#defn[Orbit and Stabiliser][
- *Orbit*: $O(x) = {g(x) : g in G}$.
- *Stabiliser*: $G_x = {g : g(x) = x} lt.eq G$.
- *Fixed points*: $"Fix"(g) = {x : g(x) = x}$.]
#thm[Orbit-Stabiliser Theorem][There is a bijection $g(x) <-> g G_x$. For a finite group $G$: $|O(x)| dot |G_x| = |G|$.]
#prf[$h(x) = g(x) <=> g^(-1)h in G_x <=> h in g G_x$.]
#thm[Orbit Decomposition][$|X| = |"Fix"(G)| + sum_(i=1)^n [G:G_(x_i)]$ (where the sum is over non-trivial orbit representatives).]
#thm[Action Homomorphisms][
- An action on a set of size $m$ gives a homomorphism $G -> S_m$ with kernel $tilde(G)_X$.
- A subgroup of index $m$ gives a homomorphism $G -> S_m$ acting on the left cosets, with the kernel contained within the subgroup.]
#thm[Cayley's Theorem][Every group of order $n$ embeds in $S_n$.]
*Transitive Action:* An action is transitive if $O(x) = X$ for all $x$. (e.g., $(RR, +)$ acting on the unit circle $S^1$ via $x(z) = e^(i x)z$).
#thm[Smallest Prime Index][If $p$ is the smallest prime factor of $|G|$, any subgroup of index $p$ is normal.]
#prf[The action on the $p$ cosets gives a homomorphism $G -> S_p$. The size of the image divides $p!$ and $|G|$. Since the prime factors of $|G|$ are $gt.eq p$, $|G\/"ker"| = p$, forcing the kernel to equal the subgroup.]
#thm[Groups of Order $p^2$][Every group of order $p^2$ is abelian ($tilde.eq C_(p^2)$ or $C_p times C_p$).]

== Conjugacy

#defn[Conjugacy Class][$x^G = {g x g^(-1) : g in G}$ (the orbit under conjugation).]
#defn[Centraliser and Centre][
- *Centraliser*: $C_G(x) = {g : g x = x g}$.
- *Centre*: $Z(G) = {g : g x = x g "for all" x} lt.tri.eq G$.]
#thm[Class Equation][$|G| = |Z(G)| + sum_(x in T) [G : C_G(x)]$ (where $T$ is a set of representatives for the non-central conjugacy classes).]
#thm[Cauchy's Theorem][If $p | |G|$, there exists an element of order $p$.]
#prf[For abelian groups: decompose into cyclic factors and find one with $p$ dividing its order. For non-abelian groups: if $p | [G:C_G(x)]$ for all $x in T$, then $p | |Z(G)|$ (reducing to the abelian case). Otherwise, $p | |C_G(x)|$ for some $x$ with $|C_G(x)| < |G|$, and the result follows by induction.]
#thm[Centre of Non-Abelian Groups][
- If $G$ is non-abelian, $G\/Z(G)$ is not cyclic.
- $Z(G)$ is the union of all 1-element conjugacy classes. 
- $|Z(G)| lt.eq |G|\/4$ for non-abelian groups.]
*Conjugates:* $G$ is never a union of conjugates of a proper subgroup.
#thm[Normal Union][$H lt.tri.eq G$ if and only if $H$ is a union of conjugacy classes.]
#defn[Normaliser][$N_G(H) = {g : g H = H g}$. We have $H lt.tri.eq N_G(H)$, and the number of conjugates of $H$ is $[G : N_G(H)]$.]

== Conjugacy in $S_n$

#defn[Cycle Type][$1^(m_1) 2^(m_2) dots n^(m_n)$ where $m_i$ is the number of $i$-cycles. The *cycle index* is $"cyc"(sigma) = sum m_i$.]
#thm[Conjugation of Cycles][$pi rho pi^(-1) = (pi(i_1) space pi(i_2) dots pi(i_k))$ for $rho = (i_1 space i_2 dots i_k)$. Thus, two permutations are conjugate in $S_n <=>$ they have the same cycle type.]
#thm[Class Sizes in $S_n$][The conjugacy class size is $n! \/ (1^(m_1) 2^(m_2) dots n^(m_n) m_1! dots m_n!)$. The centraliser order is the denominator.]
#thm[Subgroups of $S_n$][If $H lt.eq S_n$, then either $H subset.eq A_n$ or $|H inter A_n| = |H|\/2$.]
*Conjugacy in $A_n$:* An $S_n$-conjugacy class remains a single class in $A_n$, unless its centraliser lies entirely in $A_n$, in which case it splits into two equal halves.
*$A_5$ is simple:* The class sizes in $A_5$ are 1, 12, 12, 15, and 20. No combination of these (including 1) divides 60, so there are no non-trivial proper normal subgroups.
*Parity:* A $k$-cycle is even if and only if $k$ is odd. A permutation $sigma$ is even if and only if $n - "cyc"(sigma)$ is even. 
*Cycle Counting:* The number of $k$-cycles in $S_n$ is $binom(n,k)(k-1)!$.
*Conjugacy in $A_4$:* $(1 space 2 space 3)$ and $(1 space 3 space 2)$ are NOT conjugate in $A_4$ because any conjugating permutation $pi in S_4$ must be an odd permutation.
*Normal Subgroups of $S_4$:* ${e}$, $V = {e, (12)(34), (13)(24), (14)(23)}$, $A_4$, and $S_4$.

== Burnside's Formula

#thm[Burnside's Lemma][The number of orbits is $1/(|G|) sum_(g in G) |"Fix"(g)|$.]
#prf[Count pairs $(g,x)$ with $g(x) = x$ in two ways: $sum |"Fix"(g)| = sum |G_x|$. By the orbit-stabiliser theorem, $sum_(x in O) |G_x| = |G|$ for each orbit, so each orbit contributes exactly $|G|$ to the total sum.]
#thm[Colouring Formula][For $q$ colours and symmetry group $G subset.eq S_n$, the number of distinct colourings is $1/(|G|) sum_(sigma in G) q^("cyc"(sigma))$.]

*Examples:*
- *Hexagon, 3 colours:* 
  - Rotations ($C_6$): $1/6(3^6 + 2 dot 3 + 2 dot 9 + 27) = 130$. 
  - Full symmetries ($D_6$): $1/12(3^6 + 2 dot 3 + 2 dot 9 + 27 + 3 dot 81 + 3 dot 27) = 92$.
- *Pentagon:* $C_5$: $1/5(q^5 + 4q)$; $D_5$: $1/10(q^5 + 4q + 5q^3)$.
- *Tetrahedron faces, 4 colours ($A_4$):* $1/12(4^4 + 8 dot 4^2 + 3 dot 4^2) = 36$.
- *Octahedron (24 symmetries):* $q$-colourings = $1/24(q^8 + 17q^4 + 6q^2)$.

== $p$-Groups & Sylow Theorems

#thm[$p$-Groups on Finite Sets][For a $p$-group acting on a finite set $X$, $|"Fix"(G)| equiv |X| (mod p)$. In particular, by letting $G$ act on itself by conjugation, $Z(G) eq.not {e}$.]
#thm[Normaliser of $p$-Subgroups][For a $p$-subgroup $H$, $[N_G(H):H] equiv [G:H] (mod p)$.]
#thm[Sylow Theorems][Let $|G| = p^k m$ with $p divides.not m$:
(i) There exists a $p$-Sylow subgroup (of order $p^k$).
(ii) Every $p$-subgroup is contained in some $p$-Sylow subgroup.
(iii) All $p$-Sylow subgroups are conjugate.
(iv) The number of $p$-Sylows, $w_p$, satisfies $w_p equiv 1 (mod p)$ and $w_p | m$.
(v) $[G:N_G(P)] = w_p$.]
#prf[
(i)+(ii): Start with a subgroup of order $p$ (via Cauchy). The normaliser theorem shows $p | [N_G(H):H]$ for any proper $p$-subgroup, guaranteeing a larger $p$-subgroup exists by the Correspondence Theorem until we reach order $p^k$.
(iii): Let $P'$ act on the cosets $G\/P$. Since $|"Fix"(P')| equiv m (mod p) eq.not 0$, there is a coset $b P$ fixed by $P'$, implying $P' subset.eq b P b^(-1)$. Equal orders forces $P' = b P b^(-1)$.
(iv): $w_p = [G:N_G(P)]$. Let $q = [N_G(P):P]$. Then $q w_p = m$ so $w_p | m$. By the normaliser theorem, $m = q + k p$ so $w_p = 1 + k p\/q$. Since $p divides.not q$, this gives $w_p equiv 1 (mod p)$.]

#thm[Sylow Uniqueness][
- A $p$-Sylow subgroup is unique if and only if it is normal.
- Abelian groups have unique $p$-Sylows for all $p$.
- If all Sylows are unique, $G$ is isomorphic to their direct product.]
#thm[Groups of Order $p q$][Let $p > q$ be primes. An abelian group of this order is cyclic $C_(p q)$. A non-abelian group exists if and only if $q | (p-1)$; it is unique up to isomorphism, with $w_p = 1$ and $w_q = p$.]
#thm[Coprime Automorphisms][If $H lt.tri.eq G$ is cyclic and $phi(|H|)$ is coprime to $|J|$, then $h j = j h$ for all $h in H, j in J$. If $phi(|H|)$ is coprime to $|G|$ then $H subset.eq Z(G)$.]
#prf[The conjugation action defines a homomorphism $theta: J -> "Aut"(H)$. Since $|"Aut"(H)| = phi(|H|)$ is coprime to $|J|$, the image must be trivial, $|theta(J)| = 1$.]

*Key Sylow Examples:*
- *Order 133 ($7 times 19$):* $w_19 = 1$, $w_7 = 1$. Both are normal, so $G tilde.eq C_133$.
- *Order 45 ($3^2 times 5$):* $w_5 = 1$, $w_3 = 1$. The groups are $C_45$ and $C_3 times C_15$.
- *Order 455 ($5 times 7 times 13$):* $w_13 = 1$ and $w_7 = 1$, meaning there is a normal subgroup $C_91 tilde.eq P_7 P_13$. The whole group is $C_91 times.r C_5$. The automorphism group $"Aut"(C_91)$ has order $phi(91) = 72$, which is coprime to 5. This forces the semidirect product to be direct, making the group abelian, which forces $w_5 = 1$. Thus, $G tilde.eq C_455$.

== Simple Groups

#defn[Simple Group][A group with no non-trivial proper normal subgroups.]
#thm[Abelian Simple Groups][A finite abelian group is simple if and only if its order is prime.]
#thm[Subgroups of $S_n$][If $H lt.eq S_n$ is simple and $|H| > 2$, then $H subset.eq A_n$.]
#thm[Order $2m$ Non-simplicity][A group of order $2m$ (where $m > 1$ is odd) is never simple.]
#prf[Embed $G$ in $S_(2m)$ via Cayley's Theorem. An element of order 2 acts without fixed points, so it is a product of $m$ disjoint transpositions. Since $m$ is odd, this permutation is odd. Thus, $G subset.not A_(2m)$, meaning $|G inter A_(2m)| = |G|\/2$, providing a normal subgroup of index 2.]
#thm[Alternating Groups][$A_n$ is simple for $n gt.eq 5$.]
#prf[Base case $A_5$: The class sizes are 1, 12, 12, 15, and 20. No non-trivial union of these divides 60. The proof proceeds by induction using $A_(n-1)$.]
#thm[Index Bound][If $G$ is a simple group with a proper subgroup of index $m > 1$, then $|G| | m!$.]
*$A_5$ is the only simple group of order 60* (up to isomorphism).

*Non-simplicity Tests:*
- *Sylow Index Bound:* For $|G| = p^k m$ with $1 lt.eq m < p$ (and not both $k = m = 1$), the $p$-Sylow has index $m < p$. This gives a homomorphism into $S_m$, but $|G|$ cannot divide $m!$, leading to a non-trivial kernel.
- *Order 36:* $w_3 in {1,4}$. If $w_3 = 4$, the action on the Sylows gives a subgroup of index 4. By the index bound theorem, $36 | 4! = 24$, which is a contradiction.
- *Order $p^2 q^2$ ($p > q$ odd):* $w_p in {1, q, q^2}$. $w_p eq.not q$ since $p>q$. If $w_p = q^2$, then $p | q^2 - 1 = (q-1)(q+1)$, forcing $p = q+1$, which is impossible for odd primes. Thus $w_p = 1$.
- *Order $2m$ ($m > 1$ odd):* Never simple.
- *Exactly 2-element conjugacy class:* Implies not simple (the centraliser has index 2, which is automatically normal).

= Rings, Fields, Algebras

== Rings & Fields

#defn[Ring][$(R, +, times)$ is an abelian group under addition, a semigroup under multiplication, and distributive.]
#defn[Subring Test][For a non-empty subset $S$, $S$ is a subring if $a - b in S$ and $a b in S$ for all $a,b in S$.]
#defn[Quaternions $HH$][Elements $a + b i + c j + d k$ with $i^2 = j^2 = k^2 = -1$, $i j = k$, $j k = i$, $k i = j$. They are anti-commutative (e.g., $j i = -k$).]
#thm[Quaternion Properties][$HH$ is a non-commutative division ring. The inverse is $u^(-1) = overline(u) \/ ||u||^2$ where $overline(u) = a - b i - c j - d k$ and $||u|| = sqrt(a^2 + b^2 + c^2 + d^2)$.]
*Properties:* $overline(u v) = overline(v) overline(u)$; $||u v|| = ||u|| dot ||v||$.
#thm[Euler's Four-Square Identity][$(a^2+b^2+c^2+d^2)(e^2+f^2+g^2+h^2)$ is a sum of 4 squares.]
*Wedderburn's Theorem:* Every finite division ring is a field.

== Ideals & Ring Decompositions

#defn[Ideals][An ideal $I$ must be an additive subgroup of $R$. It is a *left* ideal if $r a in I$ for all $r in R, a in I$; a *right* ideal if $a r in I$; and a *two-sided* ideal if both hold. A ring is *simple* if it has no non-trivial proper two-sided ideals.]
#thm[Matrix Ring Simplicity][$M_n(D)$ is simple for any division ring $D$.]
#prf[Let $J$ be a non-zero ideal containing a matrix $A$ with $a_(r s) eq.not 0$. Then $a_(r s)^(-1) E_(i r) A E_(s j) = E_(i j)$. This shows all elementary matrices $E_(i j) in J$, meaning the identity $I_n in J$, so $J = M_n(D)$.]
#defn[Idempotents][An element $e$ with $e^2 = e$. 
- *Central*: $e r = r e$ for all $r in R$. 
- *Orthogonal*: $e f = f e = 0$. 
- *Primitive*: Cannot be decomposed as a sum of two non-zero orthogonal idempotents.]
#thm[Idempotent Properties][If $e$ is idempotent, then $1 - e$ is also idempotent, and $e(1-e) = 0$.]
#thm[Ideals with Unity][If an ideal $I$ has a unity element $e$, then $e$ is a central idempotent in $R$, and $I = e R$.]
#thm[Ring Decomposition][If $R = I + J$ with $I inter J = {0}$, then $R tilde.eq I times J$.]
#thm[Idempotent Decomposition][For a central idempotent $e$, $R = e R plus.o (1-e)R$.]

*Key Results:* 
- $e R e$ is a subring with unity $e$, where $e R e = {a : e a = a e = a}$. 
- $e + (1-e)r e$ is always an idempotent. 
- $1 - 2e$ is a self-inverse unit.
- In a simple ring with unity, every non-zero central element is a unit.

*Examples:* 
- $ZZ_18$: $9^2 = 9$; giving the decomposition $ZZ_18 = 9 ZZ_18 plus.o 10 ZZ_18$.
- $ZZ_30$ idempotents: ${0,1,6,10,15,16,21,25}$. Decomposition: $ZZ_30 = 6 ZZ_30 plus.o 10 ZZ_30 plus.o 15 ZZ_30$.

== Algebras

#defn[$K$-Algebra][An algebra $A$ is a vector space over a field $K$ equipped with a bilinear multiplication operation. It is assumed to be associative and have a unity.]
*Examples:* $RR$ and $CC$ are division algebras over $RR$. $M_n(K)$ is an $n^2$-dimensional algebra. $HH$ is a 4-dimensional non-commutative division algebra over $RR$.
#thm[Regular Representation][Every $n$-dimensional associative algebra with unity over $K$ embeds into $M_n(K)$.]
#prf[Define left multiplication $lambda_x : a |-> x a$. The map $theta: x |-> C_x$ (where $C_x$ is the matrix of $lambda_x$) is an injective algebra homomorphism.]
*Examples:* $CC$ over $RR$: $a + b i |-> mat(a, -b; b, a)$. Dual numbers: $a + b v |-> mat(a, 0; b, a)$.

#defn[Group Algebra $K G$][For a finite group $G = {x_1, dots, x_n}$ and a field $K$, $K G = {sum a_i x_i | a_i in K}$, which has dimension $n$.]
*Examples:* $|F_3 C_2| = 9$; $|F_2 S_3| = 64$; $op("dim") F_5 A_4 = 12$.

#thm[Maschke's Theorem (Partial)][Assuming $op("char")(K)$ does not divide $|G|$, $e = 1/(|G|) sum_(x in G) x$ is a central primitive idempotent. The algebra decomposes as $K G = e K G plus.o (1-e) K G$, with $op("dim")_K (e K G) = 1$.]
#prf[
_Idempotent:_ Since multiplying by $x_i$ permutes the group elements, $x_i e = e$. Then $e^2 = 1/n(x_1 e + dots + x_n e) = e$. The space $e K G = "span"{e}$ has dimension 1. 

_Primitive:_ If $e = f_1 + f_2$ with $f_1 f_2 = 0$, then $e f_i = f_i$. This forces $f_i in e K G = "span"{e}$, so $f_i = lambda_i e$. This gives $lambda_1 + lambda_2 = 1$ and $lambda_1 lambda_2 = 0$, meaning one is $0$ and the other is $1$, so $e$ cannot be decomposed.]

*Group Algebra Properties:*
- *$K C_n$:* $g - 1$ is a zero divisor because $(g-1)(1 + g + dots + g^(n-1)) = 0$. Thus, $K C_n$ is never a division algebra for $n > 1$.
- *$F_2 C_3$:* Contains 8 elements. The element $(1+g+g^2)$ is idempotent but not a unit. Thus, the set of non-zero elements of $F_2 C_3$ under multiplication is not a group.
- *$CC C_3$:* $f = 1/3(1 + omega g + omega^2 g^2)$ (where $omega = e^(2 pi i\/3)$) is an idempotent orthogonal to $e = 1/3(1+g+g^2)$.

== Key Techniques

- *Order counting:* Elements of order $k$ come in groups of $phi(k)$ (from cyclic subgroups). For example, a non-cyclic group of order 55 has $2r$ elements of order 5 and $5s$ elements of order 11, giving $2r + 5s = 54$.
- *Order 2 elements:* A group of even order has an odd number of elements of order 2 (since non-self-inverse elements pair up).
- *Subgroup Intersections:* If $|H|^2 > |G|$ and $|J|^2 > |G|$, then $H inter J eq.not {e}$ because $|H inter J| = (|H||J|)\/|H J| gt.eq (|H||J|)\/|G| > 1$.
- *$S_n$ Generators:* $S_n$ is generated by the transpositions ${(1 space i) : 2 lt.eq i lt.eq n}$, or by the set of two elements ${(2 space 3 dots n), (1 space 2)}$.
- *$A_n$ Generators:* Every element of $A_n$ (for $n gt.eq 3$) is a product of 3-cycles. Key identities (using right-to-left composition): $(i space j)(i space k) = (i space k space j)$ and $(i space j)(k space ell) = (i space j space k)(j space k space ell)$.
- *$D_6$ Decomposition:* $D_6 tilde.eq D_3 times C_2$.
- *$A_4$ Subgroups:* $A_4$ has no subgroup of order 6.
- *Conjugacy Classes:* The number of conjugacy classes is $1/(|G|) sum_(g in G) |C_G(g)|$.

== Exam Strategies

- *Sylow analysis:* Write $|G| = p^k m$. List the divisors of $m$ that are $equiv 1 (mod p)$. Use element counting to eliminate cases where Sylow subgroups intersect trivially.
- *Simple group test:* Check index bounds ($|G| | m!$), Sylow uniqueness, whether a union of conjugacy classes forms a subgroup, and the $2m$ (with $m$ odd) parity test.
- *Burnside applications:* Explicitly list the symmetries, compute the cycle index of each permutation, and apply the colouring formula.
- *Quotient identification:* Use the 1st Isomorphism Theorem by finding a suitable homomorphism, identifying its kernel and image.
- *Ring decomposition:* Find central idempotents $e_1, dots, e_k$ that sum to $1$ ($e_1 + dots + e_k = 1$) and are pairwise orthogonal ($e_i e_j = 0$). Then $R = e_1 R plus.o dots plus.o e_k R$.
