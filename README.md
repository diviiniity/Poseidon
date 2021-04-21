# Poseidon
# Welcome to Poseidon Engine!

This is a work in progress project in which I aim to have a functional and easy to use engine to develop games and apps alike.


# Installing and generating your project files

By using Git:
Clone the repository into your directory using the command `git clone --recurse-submodules -j8 git://github.com/diviiniity/Poseidon`

Then,
If you are on Windows and have Visual Studio 2019+ installed, double click the `GenerateProjects.bat` file and everything will be automatically set up

Alternatively, you can open a command prompt in the engine's root folder and run:
  `call vendor\bin\premake\premake5.exe vs2019`   

## Dependencies

- [Premake](https://github.com/premake/premake-core)
- [Glad](https://github.com/Dav1dde/glad/)
- [GLFW](https://github.com/glfw/glfw)
- [imgui](https://github.com/ocornut/imgui)
- [spdlog](https://github.com/gabime/spdlog)
- [glm](https://github.com/g-truc/glm)
  
## Credit for inspiration

The Cherno's **Hazel** engine, [GitHub](https://github.com/TheCherno/Hazel) and [Youtube](https://www.youtube.com/channel/UCQ-W1KE9EYfdxhL6S4twUNw)
