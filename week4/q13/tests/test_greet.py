import subprocess


def test_normal_name():
    result = subprocess.run(["sdt-greet", "--name", "Alice"], capture_output=True, text=True)
    assert result.returncode == 0
    assert result.stdout.strip() == "Hello, Alice!"


def test_empty_whitespace_name():
    result = subprocess.run(["sdt-greet", "--name", "   "], capture_output=True)
    assert result.returncode == 2
