import setuptools


setuptools.setup(
    name="crow", # Replace with your own username
    version="0.8.0",
    author="Assert team KTH",
    author_email="javierca@kth.se",
    description="SLUMPs randomizer",
    long_description='SLUMPs randomizer',
    long_description_content_type="text/markdown",
    url="https://github.com/KTH/slumps/blob/master/crow/slumps.py",
    packages=setuptools.find_packages(),
	
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.7',
)