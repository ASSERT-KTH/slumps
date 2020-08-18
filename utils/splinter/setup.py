import setuptools


setuptools.setup(
    name="splinter", # Replace with your own username
    version="0.8.0",
    author="Assert team KTH",
    author_email="javierca@kth.se",
    description="Split for STRAC",
    long_description='Split for STRAC',
    long_description_content_type="text/markdown",
    packages=setuptools.find_packages(),
	include_package_data=True,
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.7',
)