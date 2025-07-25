# Stylix

this is my terrible stylix fork that i made so i can use base24 themes instead of base16 themes among other things. please do not use this, it is extremely scuffed and i break things constantly

## About

Stylix is a theming framework for [NixOS](https://nixos.org), [Home
Manager](https://nix-community.github.io/home-manager#ch-introduction),
[nix-darwin](https://github.com/nix-darwin/nix-darwin#readme), and
[Nix-on-Droid](https://github.com/nix-community/nix-on-droid) that applies
color schemes, wallpapers, and fonts to a wide range of applications.

Unlike color scheme utilities such as
[base16.nix](https://github.com/SenchoPens/base16.nix) or
[nix-colors](https://github.com/Misterio77/nix-colors), Stylix goes further by
applying themes to supported applications, following the "it just works"
philosophy.

## Resources

- [Documentation](https://nix-community.github.io/stylix)
- [GitHub Discussions](https://github.com/nix-community/stylix/discussions)
- [Matrix room](https://matrix.to/#/#stylix:danth.me)

## Example configurations

### GNOME 46

<figure>
    <img src="./gnome.png" alt="GNOME 46" width=100%>
    <figcaption>
        <p>
            Wallpapers by <a
            href="https://unsplash.com/photos/three-bicycles-parked-in-front-of-building-hwLAI5lRhdM">
            Clay Banks</a> and <a
            href="https://unsplash.com/photos/brown-road-in-forest-during-daytime-L505cPnmIds">
            Derrick Cooper</a>.
        </p>
    </figcaption>
</figure>

Try a live demo of this dark theme by running:

```console
nix run github:nix-community/stylix#testbed:gnome:dark
```

### KDE Plasma 5

<figure>
    <img src="./kde.png" alt="KDE Plasma 5" width=100%>
    <figcaption>
        <p>
            Wallpapers by <a
            href="https://unsplash.com/photos/mountain-surrounded-by-trees-under-cloudy-sky-T-tOgjWZ0fQ">
            Aniket Deole</a> and <a
            href="https://unsplash.com/photos/landscape-photography-of-body-of-water-overlooking-mountain-range-ZqLeQDjY6fY">
            Tom Gainor</a>.
        </p>
    </figcaption>
</figure>

Since KDE theming is still a work in progress, some manual steps may be required
to properly apply its theme.
