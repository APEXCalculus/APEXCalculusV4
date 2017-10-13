# apex-mbx
Repository for a conversion of APEX Calculus to MathBook XML

APEX Calculus version 3.0 is available from [its source repository](https://github.com/APEXCalculus/APEXCalculus_Source). This project aims to convert the textbook to a version 4.0 in [MathBook XML](mathbook.pugetsound.edu).

# quickstart instructions
1. Clone this repository.
2. Clone [MathBook XML](https://github.com/rbeezer/mathbook) and install its dependencies.
3. Copy `Makefile.paths.original` to `Makefile.paths`. Edit `Makefile.paths` as instructed within that file.
4. Execute `make html`, `make pdf`, or other things detailed in `Makefile`. Output will be produced in the `output` folder.
