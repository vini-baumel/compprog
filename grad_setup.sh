#!/usr/bin/env bash
# Sets up VS Code for competitive programming (C++) in the current folder.
# No sudo needed. Usage:  bash setup-cp.sh   (run inside your contest folder)

GXX=$(command -v g++)
GDB=$(command -v gdb)
LLDB=$(command -v lldb)

if [ -z "$GXX" ]; then
  echo "ERROR: g++ not found. Nothing to set up."
  exit 1
fi

# Pick a debugger: gdb, then lldb, then a home-folder gdb (micromamba install)
if [ -n "$GDB" ]; then
  MIMODE="gdb";  DBG="$GDB"
elif [ -n "$LLDB" ]; then
  MIMODE="lldb"; DBG="$LLDB"
elif [ -x "$HOME/cpenv/bin/gdb" ]; then
  MIMODE="gdb";  DBG="$HOME/cpenv/bin/gdb"
else
  MIMODE="gdb";  DBG="/usr/bin/gdb"
  echo "WARNING: no debugger found. Compiling will work, F5 won't."
  echo "         Install gdb without sudo (needs internet):"
  echo "         curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba"
  echo "         ./bin/micromamba create -p ~/cpenv -c conda-forge gdb"
fi

# Install the C/C++ extension if it's missing
if command -v code >/dev/null; then
  if ! code --list-extensions | grep -qi '^ms-vscode.cpptools$'; then
    echo "Installing C/C++ extension..."
    code --install-extension ms-vscode.cpptools || echo "WARNING: extension install failed (no internet?). Try a .vsix."
  fi
fi

mkdir -p .vscode

cat > .vscode/c_cpp_properties.json <<EOF
{
  "configurations": [{
    "name": "Linux",
    "compilerPath": "$GXX",
    "cStandard": "c17",
    "cppStandard": "c++17",
    "intelliSenseMode": "linux-gcc-x64"
  }],
  "version": 4
}
EOF

cat > .vscode/tasks.json <<EOF
{
  "version": "2.0.0",
  "tasks": [{
    "label": "build",
    "type": "shell",
    "command": "$GXX",
    "args": ["-std=c++17", "-g", "-O0", "-Wall",
             "-fsanitize=address,undefined", "-D_GLIBCXX_DEBUG",
             "\${file}", "-o", "\${fileDirname}/\${fileBasenameNoExtension}"],
    "group": { "kind": "build", "isDefault": true },
    "problemMatcher": ["\$gcc"]
  }]
}
EOF

cat > .vscode/launch.json <<EOF
{
  "version": "0.2.0",
  "configurations": [{
    "name": "Debug",
    "type": "cppdbg",
    "request": "launch",
    "program": "\${fileDirname}/\${fileBasenameNoExtension}",
    "args": ["<", "\${fileDirname}/in.txt"],
    "cwd": "\${fileDirname}",
    "MIMode": "$MIMODE",
    "miDebuggerPath": "$DBG",
    "preLaunchTask": "build",
    "externalConsole": false
  }]
}
EOF

touch in.txt
echo "Done. compiler: $GXX | debugger: $DBG ($MIMODE)"
echo "Ctrl+Shift+B = build, F5 = debug (input comes from in.txt)"
