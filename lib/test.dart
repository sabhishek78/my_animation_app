import 'main.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('jumping curve',(){
    JumpingCurve curve= JumpingCurve();

    expect(curve.transformInternal(0.1),0.5);
    expect(curve.transformInternal(0.2),1.0);
    expect(curve.transformInternal(0.3),0.5);
    expect(curve.transformInternal(0.5),0.0);

  });
}