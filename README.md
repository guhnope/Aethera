This repo containes my Bluebuild recipes. 

Aethera is a Niri + DankMaterialShell immutable "distro" built on Universal Blue, designed purely around my ideal workflow and theming tastes. 
BlueMango swaps out Niri, replaces it with the Mango Wayland Compositor (MangoWC), I'm working on this one to learn more about its features. I have also added Hyprland and Sway as it was pretty easy to do.
Rebasing works across all images but ISO generation on Aethera appears busted due to some UTF-8 non-compliance in either Niri or one it's dependancies.

Remember when rebasing your home directory is persistant storage so you wont get your home directory populated from /etc/skel. There are fallbacks for Niri, Mango & Sway in /etc but Hyprland has no such ability. Also greetd may fail when rebasing from one image to another as /etc/greetd/config.toml may not point to the new compositor, this is because of how atomic handles config files in /etc.

If you are on a Fedora Atomic distro (Silverblue, Kinoite, Onyx, etc): <br>
Niri: rpm-ostree rebase ostree-unverified-registry:ghcr.io/guhnope/aethera:latest <br>
MangoWC: rpm-ostree rebase ostree-unverified-registry:ghcr.io/guhnope/bluemango:latest <br>
Hyprland: rpm-ostree rebase ostree-unverified-registry:ghcr.io/guhnope/hyprblue:latest <br>
Sway: rpm-ostree rebase ostree-unverified-registry:ghcr.io/guhnope/bluesway:latest <br>

Once you are on an a universal blue image, weather unsigned from above or Aurora, Bluefin or Bazzite: <br>
Aethera: rpm-ostree rebase ostree-image-signed:docker://ghcr.io/guhnope/aethera:latest <br>
MangoWC: rpm-ostree rebase ostree-image-signed:docker://ghcr.io/guhnope/bluemango:latest <br>
Hyprland: rpm-ostree rebase ostree-image-signed:docker://ghcr.io/guhnope/hyprblue:latest <br>
Sway: rpm-ostree rebase ostree-image-signed:docker://ghcr.io/guhnope/bluesway:latest <br>
