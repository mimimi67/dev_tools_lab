import subprocess

def test_empty_whitespace_name():
    result = subprocess.run(
        ["sdt-greet", "--name", "   "],
        capture_output=True
    )
    assert result.returncode == 2

