# Makedeb Dockerfile


Dockerfile to compile and package programs for Debian based systems using makedeb project.

The compiled package will be available via apache, to download just access http://localhost and get the deb package generated by makedeb.

Edit Dockerfile to use other git-hosted projects, or for local projects.

By using makedeb the compilation uses PKGBUILD file format to compile and package.

The project is still in the testing phase and may have flaws, feel free to report them as soon as you are sure you are doing everything correctly.

Thanks to the Makedeb project for making it easy to create packages for Debian used in this Dockerfile. <3

Link for project: https://github.com/makedeb/makedeb

Project Hosted in https://git.disroot.org/Cyber/makedeb-docker, mirrored for Github.

Project taken from the Makedeb repository, I chose this project to compare both packages, the compiled package is the one that shows the version in its name, the other one is downloaded from an external site.

