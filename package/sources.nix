{
  fetchurl,
  version,
}: {
  x86_64-linux = fetchurl {
    url = "https://github.com/ddev/ddev/releases/download/v${version}/ddev_linux-amd64.v${version}.tar.gz";
    hash = "sha256-GbM4A18rtv4DUcs5bpqDVgfkMx66/n2w/EA+RFuBwHY=";
  };
  aarch64-linux = fetchurl {
    url = "https://github.com/ddev/ddev/releases/download/v${version}/ddev_linux-arm64.v${version}.tar.gz";
    hash = "sha256-LraHUZFf1ezdCk27VxD03rZwcI4Xe8afe1nPbWWX+cY=";
  };
  x86_64-darwin = fetchurl {
    url = "https://github.com/ddev/ddev/releases/download/v${version}/ddev_macos-amd64.v${version}.tar.gz";
    hash = "sha256-sqZuEUgGlDoL33HADVkBbsxT6ms3nJTfhDtTdWSnliM=";
  };
  aarch64-darwin = fetchurl {
    url = "https://github.com/ddev/ddev/releases/download/v${version}/ddev_macos-arm64.v${version}.tar.gz";
    hash = "sha256-ui8lSBayvGnSPHjf426qKeT5on05M0l2qibl23xGEcQ=";
  };
}
