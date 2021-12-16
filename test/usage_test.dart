import 'package:captain/captain.dart';
import 'package:test/test.dart';

class AppCmd extends Command {
  AppCmd() : super(command: 'app', description: 'run as an app shell');

  @override
  void run(List<String> args, Map<String, dynamic> flags) {
    print("IN APP");
    print(args);
  }
}

class RunCmd extends Command {
  RunCmd()
      : super(
            command: 'run',
            description: 'Run a command in a shell',
            subcommands: [AppCmd()]);

  @override
  void run(List<String> args, Map<String, dynamic> flags) {
    print("IN RUN");
  }
}

void main() {
  group('Generic example', () {
    test('Supports basic example', () {
      var args = 'donker run app --bar=baz'.split(' ');
      execute(CaptainCommand('donker', subcommands: [RunCmd()]), args);

      var args2 = 'donker run app nested --bar=baz'.split(' ');
      execute(CaptainCommand('donker', subcommands: [RunCmd()]), args2);
    });
  });
}