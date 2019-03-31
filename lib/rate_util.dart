enum T { b, k, d, e, y, h, f, l, g, a, u, i, n, p, c, r, s, w }
enum S { bug, dark, dragon, electric, fairy, fighting, fire, flying, ghost, grass, ground, ice, normal, poison, psychic, rock, steel, water }
enum A { B, R, G }

A getA(T a, T d) {
  switch (a) {
    case T.b:
      return L(d, [T.k, T.a, T.c], [T.y, T.h, T.f, T.l, T.g, T.p, T.s]);
    case T.k:
      return L(d, [T.g, T.c], [T.k, T.y, T.h]);
    case T.d:
      return L(d, [T.d], [T.y, T.s]);
    case T.e:
      return L(d, [T.l, T.w], [T.d, T.e, T.a, T.u]);
    case T.y:
      return L(d, [T.k, T.d, T.h], [T.f, T.p, T.s]);
    case T.h:
      return L(d, [T.k, T.i, T.n, T.p, T.c, T.r, T.s], [T.b, T.y, T.l, T.g]);
    case T.f:
      return L(d, [T.b, T.a, T.i, T.s], [T.d, T.f, T.r, T.w]);
    case T.l:
      return L(d, [T.b, T.h, T.a], [T.e, T.r, T.s]);
    case T.g:
      return L(d, [T.g, T.c], [T.k, T.n]);
    case T.a:
      return L(d, [T.u, T.r, T.w], [T.b, T.d, T.f, T.l, T.a, T.p, T.s]);
    case T.u:
      return L(d, [T.e, T.f, T.p, T.r, T.s], [T.b, T.l, T.a]);
    case T.i:
      return L(d, [T.d, T.l, T.a, T.u], [T.f, T.i, T.s, T.w]);
    case T.n:
      return L(d, [], [T.g, T.r, T.s]);
    case T.p:
      return L(d, [T.y, T.a], [T.g, T.u, T.p, T.r, T.s]);
    case T.c:
      return L(d, [T.h, T.p], [T.k, T.c, T.s]);
    case T.r:
      return L(d, [T.b, T.f, T.l, T.i], [T.h, T.u, T.s]);
    case T.s:
      return L(d, [T.y, T.i, T.r], [T.e, T.f, T.s, T.w]);
    case T.w:
      return L(d, [T.f, T.u, T.r], [T.d, T.a, T.w]);
  }
}

A L(T d, List<T> G, List<T> B) {
  A ar = A.R;
  if (G.contains(d)) ar = A.G;
  else if (B.contains(d)) ar = A.B;
  return ar;
}