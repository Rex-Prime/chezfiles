-- must install `shasum` package
-- optional: java25-openjdk-src
return {
  'idelice/nvim-jls',
  opts = {
    jls_dir = nil,
    settings = {},
    root_markers = {
      'pom.xml',
      'build.gradle',
      'build.gradle.kts',
      'settings.gradle',
      'settings.gradle.kts',
      'WORKSPACE',
      'WORKSPACE.bazel',
      '.java-version',
      '.git',
    },
    inlay_hints = {
      enabled = true,
    },
    jvm_args = nil,
    cmd_env = {},
    auto_restart = false,
  },
}
