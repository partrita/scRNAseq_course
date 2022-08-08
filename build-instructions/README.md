## Instructions for Building Course 

These instructions are for the maintainers of the scRNA.seq.course. They explain how to build the course to test new changes and the steps needed to create a new version of the website.

### 1. Start the container

In order to ensure you have all the correct packages and dependencies installed please download the latest [docker image](https://quay.io/repository/cellgeni/scrna-seq-course?tab=tags):
```bash
docker pull quay.io/cellgeni/scrna-seq-course:latest
```

If your environment does not support docker but has Singulairty, you can convert the docker image to singularity using the following command:
```bash
singularity pull singlecellcourse.sif docker://quay.io/cellgeni/scrna-seq-course:latest
```

Once pulled you can run run a container with that image using:
```bash
docker run -it -d --name singlecellcourse quay.io/cellgeni/scrna-seq-course:latest
``` 
and then `docker exec -it singlecellcourse bash` to access the container using the command line interface.

Alternatively you can run using
```bash
docker run -p 8888:8888 -e JUPYTER_TOKEN=password quay.io/cellgeni/scrna-seq-course:latest
```
and access the Jupyter Terminal to run the next steps.

Once inside the container follow the instructions below.

### 2. Clone Repository

In order to download the course source files please enter the following command into the directory you want the course to be downloaded into:
```bash
git clone https://github.com/cellgeni/scRNA.seq.course.git
```

### 3. Download the data

1. Change directory to the newly downloaded repo (`cd scRNA.seq.course`). 
2. The course data files are hosted on a S3 bucket and to retrieve them you can run the `./poststart.sh` script from the folder where you cloned the repositroy
3. Once the data has been downloaded make sure you move (`mv data course_files/`) or symlink the data folder (`ln -s $PWD/data $PWD/course_files/data`) to make it avaible as `course_files/data` because that's where it's expected to be.


### 4. Update BibTeX file

To update references you'll need to edit `book.bib` file inside the `course_files` folder and then run [betterbib](https://github.com/texworld/betterbib).

For example, to add a new reference:
1. `cd course_files`
1. Edit `book.bib` and add the reference
```
@article{Chakir2020,
 author = {Batuhan Cakir},
 title = {Comparison of visualization tools for single-cell RNAseq data },
}
```
3. Run `betterbib update --quiet --in-place book.bib` to update the reference with latest information from [Crossref](https://www.crossref.org/). That will convert the previous entry to:
```
@article{Chakir2020,
 author = {Cakir, Batuhan and Prete, Martin and Huang, Ni and van Dongen, Stijn and Pir, Pinar and Kiselev, Vladimir Yu},
 title = {Comparison of visualization tools for single-cell {RNAseq} data},
 doi = {10.1093/nargab/lqaa052},
 number = {3},
 source = {Crossref},
 url = {https://doi.org/10.1093/nargab/lqaa052},
 volume = {2},
 journal = {NAR Genomics and Bioinformatics},
 publisher = {Oxford University Press (OUP)},
 issn = {2631-9268},
 year = {2020},
 month = jul,
}
```
4. Tidy up the references formatting suing `betterbib format --in-place book.bib`


### 5. Render the course

In order to build the course (website) and generate new cache files (for faster builds in the future) you need to `cd course_files` to change your working directory to the course_files folder.

You can now run `./build.R` to build the whole course (HTML and PDF versions). 

Alteratively you can only build the HTML version-only using:
```bash
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
```
This will instruct bookdown to render the book starting off the `index.Rmd` and using the configuration inside `_bookdown.yml` by default.


### 6. How to upload the new website to S3

Once you have built th course the folder `website` is generated. All the assets and html files required to host the website are there. To make the files avaiable publicly, these files need be uploaded to a web server or to S3 using the following command:

```bash
aws s3 sync /path-to-work-dir/course_work_dir/website/ s3://singlecellcourse/website/
```

**Please make sure to only sync production ready wbesite to the `singlecellcourse` bucket.**

### 7. How to upload the new cache to S3

Once you have built th course the folder `_bookdown_files` is generated. This folder contains the cache files that can be used to reduce the building time next time you run `bookdown::render_book(...)`.
To make the files avaiable to other poeple building the course, these files can be uploaded to S3 using the following command:

```bash
aws s3 sync /path-to-work-dir/course_work_dir/_bookdown_files/ s3://singlecellcourse/_bookdown_files/
```

**Please make sure to only sync production ready caches to the `singlecellcourse` bucket.**
