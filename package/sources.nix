{
  fetchurl,
  version,
}: {
  x86_64-linux = fetchurl {
    url = "https://github.com/ddev/ddev/releases/download/v${version}/ddev_linux-amd64.v${version}.tar.gz";
    hash = "sha256-ja6/PmR+rCR0QcSkCjE7In/OVEuYELH/GIpyCLD0dKY=";
  };
  aarch64-linux = fetchurl {
    url = "https://github.com/ddev/ddev/releases/download/v${version}/ddev_linux-arm64.v${version}.tar.gz";
    hash = "sha256-FRw674tAQ/REZCSBQ7tPFgqWFN7aBP4RYInGh1+zhAs=";
  };
  x86_64-darwin = fetchurl {
    url = "https://github.com/ddev/ddev/releases/download/v${version}/ddev_macos-amd64.v${version}.tar.gz";
    hash = "sha256-XW2RGk9CNkM/a8OKiaidj3OMPJbe1cy2QYhjvFhB7Vk=";
  };
  aarch64-darwin = fetchurl {
    url = "https://github.com/ddev/ddev/releases/download/v${version}/ddev_macos-arm64.v${version}.tar.gz";
    hash = "sha256-jgAUR5M8PWxGay2J2rugGJtGLPyEwhVpOUnQIXLX3Pw=";
  };
}
