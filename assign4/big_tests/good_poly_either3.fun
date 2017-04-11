type Either['A, 'B] = Left [l: 'A, r: unit] | Right [l: unit, r: 'B]

let map = ['A, 'B](fa: ('A) => 'A, fb: ('B) => 'B, e: Either<'A, 'B>) =>
    case e of
    | Left(record) => Left<'A, 'B>([l = fa(record.l), r = record.r])
    | Right(record) => Right<'A, 'B>([l = record.l, r = fb(record.r)])
in map<num, bool>((n: num) => n + 1, (b: bool) => !b, Left<num, bool>([l = 5, r = nil]))
