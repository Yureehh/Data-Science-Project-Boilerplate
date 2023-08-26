from setuptools import find_packages, setup

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="src",
    packages=find_packages(),
    version="0.1.0",
    description="This repo gets cloned everytime I start a new Data Science project...",
    author="Yureeh",
    license="MIT",
    install_requires=requirements,  # Dependencies are now dynamically read from requirements.txt
    include_package_data=True,
    classifiers=[
        "Development Status :: 3 - Alpha",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.11",
    ],
)
