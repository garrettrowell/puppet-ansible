# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ansible::install
class ansible::install (
  Array[String] $dependencies = ['python3', 'python3-pip'],
) {
  package { $dependencies:
    ensure => installed,
  }

  package { 'ansible':
    ensure          => installed,
    provider        => 'pip3',
    install_options => ['--break-system-packages'],
    require         => Package[$dependencies],
  }

  package { 'jinja2':
    ensure          => latest,
    provider        => 'pip3',
    install_options => ['--break-system-packages'],
    require         => Package['ansible'],
  }
}
