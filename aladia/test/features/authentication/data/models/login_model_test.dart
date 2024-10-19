import "package:aladia/features/authentication/data/models/login_model.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  group("LoginModel", () {
    test("should return  a valid model", () {
      final Map<String, dynamic> json = {
        "email": "firaol@gmail.com",
        "password": "password"
      };
      final model = LoginRequest.fromJson(json);

      expect(model.email, "firaol@gmail.com");
      expect(model.password, "password");
    });

    test("should return a valid json", () {
      final model =
          LoginRequest(email: "firaol@gmail.com", password: "password");
      final json = model.toJson();

      expect(json["email"], "firaol@gmail.com");
      expect(json["password"], "password");
    });

    test("should return a valid response model", () {
      final Map<String, dynamic> json = {"accessToken": "accessToken"};
      final model = LoginResponse.fromJson(json);

      expect(model.accessToken, "accessToken");
    });
  });
}
