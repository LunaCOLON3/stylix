{ colors, inputs }:
let
  theme = colors {
    templateRepo = inputs.tinted-shell;
    target = "base24";
  };
in
''
  exec bash ${theme}

  # See https://github.com/tomyun/base16-fish/issues/7 for why this condition exists
  if status --is-interactive && test -z "$TMUX"
    base24-${colors.slug}
  end
''
