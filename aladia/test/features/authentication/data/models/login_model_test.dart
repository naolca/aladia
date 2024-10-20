import "package:aladia/features/authentication/data/models/login_model.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("LoginModel", () {
    test(
        "Upon a correct initialization, the LoginModel object should be correct.",
        () {
      final Map<String, dynamic> json = {
        "email": "firaol@gmail.com",
        "password": "password"
      };
      final model = LoginRequest.fromJson(json);

      expect(model.email, "firaol@gmail.com");
      expect(model.password, "password");
    });

    test(
        "A correct JSON object should be create from a LoginModel class upon need.",
        () {
      final model =
          LoginRequest(email: "firaol@gmail.com", password: "password");
      final json = model.toJson();

      expect(json["email"], "firaol@gmail.com");
      expect(json["password"], "password");
    });

    test(
        "Upon a correct initialization from a JSON Object, the LoginModel object should be correct.",
        () {
      final Map<String, dynamic> json = {"accessToken": "accessToken"};
      final model = LoginResponse.fromJson(json);

      expect(model.accessToken, "accessToken");
    });
  });
}
