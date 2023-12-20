enum Gender { Male, Female, Other }

void main(List<String> args) {
  for (var gender in Gender.values) {
    print("${gender.name}");
  }
}
