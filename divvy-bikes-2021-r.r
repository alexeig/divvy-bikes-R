{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "f2865463",
   "metadata": {
    "papermill": {
     "duration": 0.140543,
     "end_time": "2022-01-26T03:25:27.779689",
     "exception": false,
     "start_time": "2022-01-26T03:25:27.639146",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Case Study: How does a bike-share navigate speedy success?\n",
    "Capstone project by Alex Gerulaitis, as part of [Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics) program on Coursera.\n",
    "\n",
    "**Work started**: Nov 28, 2021.\n",
    "\n",
    "**Dataset**: [Cyclistic Bike Share Dataset (Nov 2020 - Oct 2021)](https://www.kaggle.com/hassanamiri/cyclistic-bike-share-dataset-nov-2020-oct-2021)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "568e1439",
   "metadata": {
    "papermill": {
     "duration": 0.13632,
     "end_time": "2022-01-26T03:25:28.053322",
     "exception": false,
     "start_time": "2022-01-26T03:25:27.917002",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### Background\n",
    "\n",
    "The \"Case Study 1\" of the Capstone Project asks to analyze the data from a fictional bike sharing service called \"Cyclistic\", with the data supplied by a real world bike sharing service \"Divvy Bikes\". \"Cyclistic\" and \"Divvy Bikes\" will be used interchangeably in this analysis, referring to the same data. Per the Case Study:\n",
    "\n",
    "> You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.\n",
    "> \n",
    "> **Ask**\n",
    "> \n",
    "> Three questions will guide the future marketing program:\n",
    "> * How do annual members and casual riders use Cyclistic bikes differently?\n",
    "> * Why would casual riders buy Cyclistic annual memberships?\n",
    "> * How can Cyclistic use digital media to influence casual riders to become members?\n",
    ">\n",
    "> Moreno has assigned you the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?\n",
    "> \n",
    "> You will produce a report with the following deliverables:\n",
    "> * A clear statement of the business task\n",
    "> * A description of all data sources used\n",
    "> * Documentation of any cleaning or manipulation of data\n",
    "> * A summary of your analysis\n",
    "> * Supporting visualizations and key findings\n",
    "> * Your top three recommendations based on your analysis"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "542b130d",
   "metadata": {
    "papermill": {
     "duration": 0.136708,
     "end_time": "2022-01-26T03:25:28.327382",
     "exception": false,
     "start_time": "2022-01-26T03:25:28.190674",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### Business Task\n",
    "\n",
    "Our task therefore is to answer the question below via deliverables outlined above:\n",
    "\n",
    "> How do annual members and casual riders use Cyclistic bikes differently?\n",
    "\n",
    "\n",
    "#### Data Sources\n",
    "\n",
    "* Dataset: [Cyclistic Bike Share Dataset (Nov 2020 - Oct 2021)](https://www.kaggle.com/hassanamiri/cyclistic-bike-share-dataset-nov-2020-oct-2021). The dataset consists of a series of CSV files that a fellow Kaggle user [Hassan Amiri](https://www.kaggle.com/hassanamiri) downloaded from Divvy Bikes public repository and uploaded to Kaggle as a public dataset (thank you!).\n",
    "* Source: [Divvy Data](https://ride.divvybikes.com/system-data): \"Historical trip data available to the public\"\n",
    "* License: [Divvy Data License Agreement](https://ride.divvybikes.com/data-license-agreement):\n",
    "> a non-exclusive, royalty-free, limited, perpetual license to access, reproduce, analyze, copy, modify, distribute in your product or service and use the Data for any lawful purpose (“License”)\n",
    "\n",
    "For further deliverables, please follow this document."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "443510e3",
   "metadata": {
    "papermill": {
     "duration": 0.137074,
     "end_time": "2022-01-26T03:25:28.601114",
     "exception": false,
     "start_time": "2022-01-26T03:25:28.464040",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### The Process\n",
    "\n",
    "We will split the analysis into the following steps:\n",
    "\n",
    "1. Ingest Data (read from CSV file(s))\n",
    "    + Analyzie for consistency across separate CSV files.\n",
    "    + Normalize if needed (e.g. if column names, formatting or types are different between files)\n",
    "    + Combine separate CSV files into a single dataset.\n",
    "1. Clean and prepare:\n",
    "    + ID and remove aberrant data;\n",
    "    + convert types if needed (e.g. timestamps - from `character` to `POSIXct`)\n",
    "    + add data if needed (e.g. separate fields for \"day of week\", \"year\", etc.)\n",
    "1. Conduct Descriptive Analysis: identify trends and insights via statistical analysis and visualizations.\n",
    "1. Summary, conclusions, recommendations.\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2337e488",
   "metadata": {
    "papermill": {
     "duration": 0.136274,
     "end_time": "2022-01-26T03:25:28.874668",
     "exception": false,
     "start_time": "2022-01-26T03:25:28.738394",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### References\n",
    "\n",
    "* Coursera Capstone Project: [Case Study: How does a bike-share navigate speedy success?](https://www.coursera.org/learn/google-data-analytics-capstone/supplement/7PGIT/case-study-1-how-does-a-bike-share-navigate-speedy-success)\n",
    "* Kevin Hartman's [\"Divvy Exercise R Script\"](https://docs.google.com/document/d/1TTj5KNKf4BWvEORGm10oNbpwTRk1hamsWJGj6qRWpuI/edit).\n",
    "* Kevin Hartman's [\"‘Sophisticated, Clear, and Polished’: Divvy and Data Visualization (Case Study)\"](https://artscience.blog/home/divvy-dataviz-case-study).\n",
    "* [Divvy Data](https://ride.divvybikes.com/system-data): \"Historical trip data available to the public\"\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "15f879d8",
   "metadata": {
    "papermill": {
     "duration": 0.137652,
     "end_time": "2022-01-26T03:25:29.150059",
     "exception": false,
     "start_time": "2022-01-26T03:25:29.012407",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Step 1: Ingest Data"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3fb37247",
   "metadata": {
    "papermill": {
     "duration": 0.137667,
     "end_time": "2022-01-26T03:25:29.425546",
     "exception": false,
     "start_time": "2022-01-26T03:25:29.287879",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "1.1. Initialize needed packages\n",
    "> Kaggle R environment comes with many analytics packages already installed.\n",
    "> It is defined by the [kaggle/rstats Docker image](https://github.com/kaggle/docker-rstats)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "707882c0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:25:29.704599Z",
     "iopub.status.busy": "2022-01-26T03:25:29.703673Z",
     "iopub.status.idle": "2022-01-26T03:25:31.034491Z",
     "shell.execute_reply": "2022-01-26T03:25:31.032878Z"
    },
    "papermill": {
     "duration": 1.472921,
     "end_time": "2022-01-26T03:25:31.034687",
     "exception": false,
     "start_time": "2022-01-26T03:25:29.561766",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.5     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.5     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.7\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.0.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "library(lubridate)\n",
    "library(dplyr)\n",
    "library(readr)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "dc4f87cd",
   "metadata": {
    "papermill": {
     "duration": 0.142634,
     "end_time": "2022-01-26T03:25:31.324865",
     "exception": false,
     "start_time": "2022-01-26T03:25:31.182231",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "1.2 Get a list of CSV files from the source data directory"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "154293af",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:25:31.646368Z",
     "iopub.status.busy": "2022-01-26T03:25:31.611968Z",
     "iopub.status.idle": "2022-01-26T03:25:31.683686Z",
     "shell.execute_reply": "2022-01-26T03:25:31.681892Z"
    },
    "papermill": {
     "duration": 0.217883,
     "end_time": "2022-01-26T03:25:31.683893",
     "exception": false,
     "start_time": "2022-01-26T03:25:31.466010",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "source_data_dir <- \"../input/cyclistic-bike-share-dataset-nov-2020-oct-2021/\"\n",
    "# list.files(path = source_data_dir)\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session\n",
    "\n",
    "csv_file_list <- list.files( path=source_data_dir, pattern=\"^.+\\\\.csv$\", full.names = FALSE, include.dirs = FALSE)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "36847f5f",
   "metadata": {
    "papermill": {
     "duration": 0.143066,
     "end_time": "2022-01-26T03:25:31.971201",
     "exception": false,
     "start_time": "2022-01-26T03:25:31.828135",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "1.3. Read the CSV files into a Dataframe while also:\n",
    "* compute `ride_duration_sec` field for the ride duration in seconds and add it to the dataframe\n",
    "* create small `colnames_df` and `metadata_df` dataframes that will assist us in confirming uniformity of column names in the CSV files (not a given) and normalizing the data\n",
    "* drops columns that are not needed: longitude, latitude, etc. (These might be helpful potentially in restoring missing data such as missing stations names and IDs - yet we'll save this for another time.)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "d344094e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:25:32.263866Z",
     "iopub.status.busy": "2022-01-26T03:25:32.262393Z",
     "iopub.status.idle": "2022-01-26T03:26:39.166348Z",
     "shell.execute_reply": "2022-01-26T03:26:39.164435Z"
    },
    "papermill": {
     "duration": 67.052208,
     "end_time": "2022-01-26T03:26:39.166600",
     "exception": false,
     "start_time": "2022-01-26T03:25:32.114392",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# read files into DF\n",
    "\n",
    "# initialize a dataframe\n",
    "divvy_trips <- data.frame()\n",
    "\n",
    "# store colnames in a special DF to verify uniformity\n",
    "colnames_df <- data.frame()\n",
    "metadata_df <- data.frame()\n",
    "\n",
    "for (i in 1:length(csv_file_list)){\n",
    "\n",
    "  temp_data <- read_csv( paste( source_data_dir, csv_file_list[i], sep='/'),\n",
    "                         show_col_types = FALSE)\n",
    "  \n",
    "  # drop columns we will not be needing (longitude, latitude, etc.)\n",
    "  # to reduce memory usage\n",
    "  temp_data <- temp_data %>%\n",
    "    select( -c( start_lat, start_lng, end_lat, end_lng))\n",
    "\n",
    "\n",
    "  # Add a \"ride_duration_sec\" calculation to divvy_trips (in seconds)\n",
    "  temp_data$ride_duration_sec <- as.numeric(as.character(difftime( temp_data$ended_at, temp_data$started_at), units = c(\"secs\")))\n",
    "\n",
    "  \n",
    "  # get colnames and add them to a separate dataframe for analysis\n",
    "  colnames_df <- rbind( colnames_df, c( csv_file_list[i], ncol(temp_data), colnames(temp_data)))\n",
    "\n",
    "  # add statistical info about the data in each file to a separate DF\n",
    "\n",
    "  metadata_df <- rbind( metadata_df,\n",
    "      c( csv_file_list[i], nrow(temp_data), NA,\n",
    "        list(\n",
    "          min(temp_data$started_at),\n",
    "          # period in days covered by this CSV\n",
    "          as.numeric( as.character( difftime( max(temp_data$started_at),\n",
    "            min(temp_data$started_at)), units = c(\"days\")))\n",
    "          )\n",
    "        )\n",
    "  )\n",
    "  \n",
    "  \n",
    "  # add newly ingested data to the dataframe\n",
    "  # (for each iteration, bind the new data to the building dataset)\n",
    "  divvy_trips <- rbind(divvy_trips, temp_data)\n",
    "\n",
    "\n",
    "}\n",
    "\n",
    "#\n",
    "# colnames(colnames_df) <- c(\"filename\", \"ncols\", colnames(temp_data))\n",
    "colnames(metadata_df) <- c(\"filename\", \"no_rides\", \"% of total rides\",\n",
    "    \"date_started_at - first\", \"period in days\")\n",
    "\n",
    "# calculate percentages of total rides for each CSV\n",
    "metadata_df$'% of total rides' <- sprintf( \"%0.2f%%\", metadata_df$no_rides / sum(metadata_df$no_rides) * 100)\n",
    "\n",
    "\n",
    "# set a datetime column to POSIXct type - if the column name starts with `_date`\n",
    "date_columns <- grep('^date_', names(metadata_df))\n",
    "metadata_df[date_columns] <- lapply(metadata_df[date_columns], function(x) as.POSIXct(x, origin = '1970-01-01'))\n",
    "\n",
    "colnames(colnames_df) <- c(\"filename\", \"no. of columns\", colnames(temp_data))\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a432c480",
   "metadata": {
    "papermill": {
     "duration": 0.144441,
     "end_time": "2022-01-26T03:26:39.456104",
     "exception": false,
     "start_time": "2022-01-26T03:26:39.311663",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Examining the two auxiliary dataframes - `colnames_df` and `metadata_df` created in the above code chunk gives us aggregated information about each CSV and whether it contains good data, and uniform column names. We'll do such rudimentary checking in the next code chunk - yet it's always a good idea to examine those two small dataframes manually via `View()`."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8f8ca0c4",
   "metadata": {
    "papermill": {
     "duration": 0.142157,
     "end_time": "2022-01-26T03:26:39.742550",
     "exception": false,
     "start_time": "2022-01-26T03:26:39.600393",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "1.4. Cursory check on the ingested data."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "617da0db",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:26:40.036296Z",
     "iopub.status.busy": "2022-01-26T03:26:40.034528Z",
     "iopub.status.idle": "2022-01-26T03:26:43.835705Z",
     "shell.execute_reply": "2022-01-26T03:26:43.836437Z"
    },
    "papermill": {
     "duration": 3.949611,
     "end_time": "2022-01-26T03:26:43.836717",
     "exception": false,
     "start_time": "2022-01-26T03:26:39.887106",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "total rows ingested      : 5378834 \n",
      "rows in the final dataset: 5378834 \n",
      "difference               : 0 \n",
      "all observations counted : TRUE \n",
      "          percent of NAs : 4.64%  (of all values)\n",
      "      NAs in key columns : 0 \n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>NAs</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>ride_id</th><td>     0</td></tr>\n",
       "\t<tr><th scope=row>rideable_type</th><td>     0</td></tr>\n",
       "\t<tr><th scope=row>started_at</th><td>     0</td></tr>\n",
       "\t<tr><th scope=row>ended_at</th><td>     0</td></tr>\n",
       "\t<tr><th scope=row>start_station_name</th><td>600479</td></tr>\n",
       "\t<tr><th scope=row>start_station_id</th><td>600586</td></tr>\n",
       "\t<tr><th scope=row>end_station_name</th><td>646471</td></tr>\n",
       "\t<tr><th scope=row>end_station_id</th><td>646548</td></tr>\n",
       "\t<tr><th scope=row>member_casual</th><td>     0</td></tr>\n",
       "\t<tr><th scope=row>ride_duration_sec</th><td>     0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 1\n",
       "\\begin{tabular}{r|l}\n",
       "  & NAs\\\\\n",
       "  & <dbl>\\\\\n",
       "\\hline\n",
       "\tride\\_id &      0\\\\\n",
       "\trideable\\_type &      0\\\\\n",
       "\tstarted\\_at &      0\\\\\n",
       "\tended\\_at &      0\\\\\n",
       "\tstart\\_station\\_name & 600479\\\\\n",
       "\tstart\\_station\\_id & 600586\\\\\n",
       "\tend\\_station\\_name & 646471\\\\\n",
       "\tend\\_station\\_id & 646548\\\\\n",
       "\tmember\\_casual &      0\\\\\n",
       "\tride\\_duration\\_sec &      0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 1\n",
       "\n",
       "| <!--/--> | NAs &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| ride_id |      0 |\n",
       "| rideable_type |      0 |\n",
       "| started_at |      0 |\n",
       "| ended_at |      0 |\n",
       "| start_station_name | 600479 |\n",
       "| start_station_id | 600586 |\n",
       "| end_station_name | 646471 |\n",
       "| end_station_id | 646548 |\n",
       "| member_casual |      0 |\n",
       "| ride_duration_sec |      0 |\n",
       "\n"
      ],
      "text/plain": [
       "                   NAs   \n",
       "ride_id                 0\n",
       "rideable_type           0\n",
       "started_at              0\n",
       "ended_at                0\n",
       "start_station_name 600479\n",
       "start_station_id   600586\n",
       "end_station_name   646471\n",
       "end_station_id     646548\n",
       "member_casual           0\n",
       "ride_duration_sec       0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Verify validity and integrity of the ingested data\n",
    "\n",
    "# analyze the two generated metadata dataframes (colnames_df, metadata_df) for issues:\n",
    "# - all columns should be the same except for 'filename' in colnames_df\n",
    "# - look for anomalies in metadata_df\n",
    "\n",
    "# the dataframe contains field names (column names) from each CSV file that is part of the\n",
    "# divvy_trips dataframe and for the dataset to be analyzed, fields and their types must match\n",
    "\n",
    "# - sum the rows in divvy_trips_metadata, compare to # of row in the resulting\n",
    "#   dataframe - this should give us an idea if anything went wrong\n",
    "# - check for bad types (non-numeric values that should only be numeric, non-dates that should be dates\n",
    "# - check for date consistencies - e.g. no multi-day gaps or unusual spikes\n",
    "#   indicating potential DQ issues\n",
    "\n",
    "datarows_ingested <- \n",
    "  summarise( \n",
    "    metadata_df,\n",
    "    numrows = sum( as.numeric(as.character(no_rides))))$numrows\n",
    "\n",
    "cat( \"total rows ingested      :\", datarows_ingested, \"\\n\")\n",
    "cat( \"rows in the final dataset:\", nrow(divvy_trips), \"\\n\")\n",
    "cat( \"difference               :\", datarows_ingested - nrow(divvy_trips), \"\\n\")\n",
    "cat( \"all observations counted :\", datarows_ingested == nrow(divvy_trips), \"\\n\")\n",
    "\n",
    "\n",
    "# check for NA values in columns where there shouldn't be any\n",
    "\n",
    "# percentage of NA vs. all values in the dataframe:\n",
    "cat( \"          percent of NAs :\",\n",
    "      sprintf( '%0.2f%%', sum(colSums(is.na(divvy_trips))) /\n",
    "        (nrow(divvy_trips) * ncol(divvy_trips)) * 100), \" (of all values)\\n\")\n",
    "\n",
    "# total NAs only in columnns we care about (timestamps, duration, user type)\n",
    "divvy_cols_we_need <- c(\"ride_id\", \"rideable_type\", \"started_at\", \"ended_at\", \"member_casual\", \"ride_duration_sec\")\n",
    "cat( \"      NAs in key columns :\", \n",
    "      colSums(is.na(divvy_trips[divvy_cols_we_need])) %>% sum(), \"\\n\")\n",
    "\n",
    "# see NAs across all columns\n",
    "colSums(is.na(divvy_trips)) %>%\n",
    "  as.data.frame() %>% \n",
    "  `colnames<-`(\"NAs\") %>%\n",
    "  View()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "00f87ab6",
   "metadata": {
    "papermill": {
     "duration": 0.155448,
     "end_time": "2022-01-26T03:26:44.147843",
     "exception": false,
     "start_time": "2022-01-26T03:26:43.992395",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Key findings from the above output:\n",
    "* All the rows in the CSVs have been successfuly ingested.\n",
    "* Checking `colnames_df` and `metadata_df` shows no apparent issues with the data, or inconsistencies in column names.\n",
    "* `NA` values in key columns (that we will be analyzing): 0. That's good news.\n",
    "* `NA` values in station names and IDs: about 1%. This potentially indicates a data quality issue.\n",
    "\n",
    "If this was a real world project, the missing stations may have required us to go back to the source of the data and check on the reasons those stations are missing, and document it before proceeding. Given this is an exercise, we'll simply be mindful of this and proceed regardless."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5d6c580f",
   "metadata": {
    "papermill": {
     "duration": 0.151058,
     "end_time": "2022-01-26T03:26:44.450489",
     "exception": false,
     "start_time": "2022-01-26T03:26:44.299431",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Step 2: Clean and prepare\n",
    "\n",
    "* identify and remove aberrant data;\n",
    "* transform data or convert types if needed  - e.g. `character` timestamps to `POSIXct`, etc. (not needed)\n",
    "* calculate needed fields - e.g. duration, \"day of week\", \"year\", etc. (already done for `ride_duration_sec` while other values are calculated on the fly.\n",
    "\n",
    "\n",
    "#### Removing aberrant data\n",
    "\n",
    "The \"[Divvy Data](https://ride.divvybikes.com/system-data)\" page says this:\n",
    "\n",
    "> The data has been processed to remove trips that are taken by staff as they service and inspect the system; and any trips that were below 60 seconds in length (potentially false starts or users trying to re-dock a bike to ensure it was secure).\n",
    "\n",
    "This tells us:\n",
    "\n",
    "1. Removing trips under 60 seconds should be safe.\n",
    "1. Identifying and removing maintenance trips (\"taken by staff as they service and inspect the system\") - should also be safe.\n",
    "\n",
    "Also: whould we drop trips over a day? (Nobody takes the bikes home or rides long distance - the service is designed for two rider types:\n",
    "\n",
    "* commute (station to station), and\n",
    "* casual / leisure - \"ride in a park or along the bankment\" type where the bikes are usually returned to the same station. (We should run an analysis to confirm the latter.)\n",
    "\n",
    "Yet given no indication the dataset owners are doing that in their [\"cleaned data\"](https://ride.divvybikes.com/system-data) - or that anyone else is doing that, we'll drop that idea for this exercise.)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9bc054af",
   "metadata": {
    "papermill": {
     "duration": 0.150255,
     "end_time": "2022-01-26T03:26:44.750851",
     "exception": false,
     "start_time": "2022-01-26T03:26:44.600596",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Next: analyze trips under 60 seconds"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "46680e6b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:26:45.062275Z",
     "iopub.status.busy": "2022-01-26T03:26:45.060043Z",
     "iopub.status.idle": "2022-01-26T03:26:45.556599Z",
     "shell.execute_reply": "2022-01-26T03:26:45.554852Z"
    },
    "papermill": {
     "duration": 0.656372,
     "end_time": "2022-01-26T03:26:45.556806",
     "exception": false,
     "start_time": "2022-01-26T03:26:44.900434",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. \n",
       "-1742998      418      743     1229     1346  3356649 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "'0.03%: percentage of trips with negative duration'"
      ],
      "text/latex": [
       "'0.03\\%: percentage of trips with negative duration'"
      ],
      "text/markdown": [
       "'0.03%: percentage of trips with negative duration'"
      ],
      "text/plain": [
       "[1] \"0.03%: percentage of trips with negative duration\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "'1.53%: percentage of trips &lt; 60 seconds'"
      ],
      "text/latex": [
       "'1.53\\%: percentage of trips < 60 seconds'"
      ],
      "text/markdown": [
       "'1.53%: percentage of trips &lt; 60 seconds'"
      ],
      "text/plain": [
       "[1] \"1.53%: percentage of trips < 60 seconds\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(divvy_trips$ride_duration_sec)\n",
    "\n",
    "# The above tells us the dataset may have a significant number of trips\n",
    "# with negative duration. Let's see how many, percentage of total, and\n",
    "# perhaps how many unique stations are involved\n",
    "\n",
    "sprintf( \"%0.2f%%: percentage of trips with negative duration\", length( which( divvy_trips$ride_duration_sec < 0 )) / nrow(divvy_trips) * 100)\n",
    "# result  0.05%, or statistically insignificant\n",
    "# what about < 60 seconds?\n",
    "\n",
    "sprintf( \"%0.2f%%: percentage of trips < 60 seconds\", length( which( divvy_trips$ride_duration_sec < 60 )) / nrow(divvy_trips) * 100)\n",
    "# 1.57% - which is quite a bit more"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1f18b1f7",
   "metadata": {
    "papermill": {
     "duration": 0.156935,
     "end_time": "2022-01-26T03:26:45.872168",
     "exception": false,
     "start_time": "2022-01-26T03:26:45.715233",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "This tells us there's clearly some issues with the data - negative and unusually high (over a day) ride durations. Let's analyize this a little more."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a8be0157",
   "metadata": {
    "papermill": {
     "duration": 0.158612,
     "end_time": "2022-01-26T03:26:46.190664",
     "exception": false,
     "start_time": "2022-01-26T03:26:46.032052",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Next: Analyze distribution of trip durations"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "22c41d3b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:26:46.516489Z",
     "iopub.status.busy": "2022-01-26T03:26:46.514299Z",
     "iopub.status.idle": "2022-01-26T03:26:49.924669Z",
     "shell.execute_reply": "2022-01-26T03:26:49.923134Z"
    },
    "papermill": {
     "duration": 3.574325,
     "end_time": "2022-01-26T03:26:49.924846",
     "exception": false,
     "start_time": "2022-01-26T03:26:46.350521",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_duration</th><th scope=col>trips</th><th scope=col>percent trips</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td><span style=white-space:pre-wrap>segment 1: &lt; 0  </span></td><td><span style=white-space:pre-wrap>   1393</span></td><td><span style=white-space:pre-wrap>   0.03%</span></td></tr>\n",
       "\t<tr><td>segment 2: &lt; 1m </td><td><span style=white-space:pre-wrap>  80654</span></td><td><span style=white-space:pre-wrap>   1.50%</span></td></tr>\n",
       "\t<tr><td>segment 3: &lt; 60m</td><td>5044698</td><td><span style=white-space:pre-wrap>  93.79%</span></td></tr>\n",
       "\t<tr><td>segment 4: &lt; 3h </td><td> 225291</td><td><span style=white-space:pre-wrap>   4.19%</span></td></tr>\n",
       "\t<tr><td>segment 5: &lt; 1d </td><td><span style=white-space:pre-wrap>  22960</span></td><td><span style=white-space:pre-wrap>   0.43%</span></td></tr>\n",
       "\t<tr><td>segment 6: &gt;= 1d</td><td><span style=white-space:pre-wrap>   3838</span></td><td><span style=white-space:pre-wrap>   0.07%</span></td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 3\n",
       "\\begin{tabular}{lll}\n",
       " ride\\_duration & trips & percent trips\\\\\n",
       " <chr> & <int> & <chr>\\\\\n",
       "\\hline\n",
       "\t segment 1: < 0   &    1393 &    0.03\\%\\\\\n",
       "\t segment 2: < 1m  &   80654 &    1.50\\%\\\\\n",
       "\t segment 3: < 60m & 5044698 &   93.79\\%\\\\\n",
       "\t segment 4: < 3h  &  225291 &    4.19\\%\\\\\n",
       "\t segment 5: < 1d  &   22960 &    0.43\\%\\\\\n",
       "\t segment 6: >= 1d &    3838 &    0.07\\%\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 3\n",
       "\n",
       "| ride_duration &lt;chr&gt; | trips &lt;int&gt; | percent trips &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| segment 1: &lt; 0   |    1393 |    0.03% |\n",
       "| segment 2: &lt; 1m  |   80654 |    1.50% |\n",
       "| segment 3: &lt; 60m | 5044698 |   93.79% |\n",
       "| segment 4: &lt; 3h  |  225291 |    4.19% |\n",
       "| segment 5: &lt; 1d  |   22960 |    0.43% |\n",
       "| segment 6: &gt;= 1d |    3838 |    0.07% |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_duration    trips   percent trips\n",
       "1 segment 1: < 0      1393    0.03%     \n",
       "2 segment 2: < 1m    80654    1.50%     \n",
       "3 segment 3: < 60m 5044698   93.79%     \n",
       "4 segment 4: < 3h   225291    4.19%     \n",
       "5 segment 5: < 1d    22960    0.43%     \n",
       "6 segment 6: >= 1d    3838    0.07%     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "divvy_trips %>% \n",
    "  mutate( ride_duration = case_when(\n",
    "    ride_duration_sec < 0 ~ \"segment 1: < 0\",\n",
    "    ride_duration_sec < 60 ~ \"segment 2: < 1m\",\n",
    "    ride_duration_sec < 60*60 ~ \"segment 3: < 60m\",\n",
    "    ride_duration_sec < 60*60*3 ~ \"segment 4: < 3h\",\n",
    "    ride_duration_sec < 60*60*24 ~ \"segment 5: < 1d\",\n",
    "    ride_duration_sec >= 60*60*24 ~ \"segment 6: >= 1d\",\n",
    "    TRUE ~ \"all other\")) %>% \n",
    "  \n",
    "  group_by( ride_duration) %>% \n",
    "\n",
    "  summarise(\n",
    "    trips = n()\n",
    "    ,'percent trips' = sprintf( '%7.2f%%', trips /\n",
    "                                 nrow(divvy_trips) * 100)\n",
    "    # ,'percent start stations involved' =\n",
    "    #   sprintf( '%0.2f%%', length( unique( start_station_id)) /\n",
    "    #   length( unique( divvy_trips$start_station_id)) * 100)\n",
    "    # ,'percent end stations involved' =\n",
    "    #   sprintf( '%0.2f%%', length( unique( end_station_id)) /\n",
    "    #   length( unique( divvy_trips$end_station_id)) * 100)\n",
    "    # ,'avg duration' = mean( ride_duration_sec)\n",
    "  )"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "eb9c70c1",
   "metadata": {
    "papermill": {
     "duration": 0.161597,
     "end_time": "2022-01-26T03:26:50.249634",
     "exception": false,
     "start_time": "2022-01-26T03:26:50.088037",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The above tells us:\n",
    "* Percentage of trips with negative durations is very small.\n",
    "* Percentage of trips with unusually long durations (over a day) is also very small.\n",
    "* Percentage of trips under a minute is realtively high (1.5%) - and we're supposed to drop them as they are likely \"bike re-docking\", per Divvy Bikes.\n",
    "* Despite that the percentage of unusually long trips is small, they may still skew average durations in our analysis, and thus it may be a good idea to drop them. We will analyse this in more details further in our analysis."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a7bb26f2",
   "metadata": {
    "papermill": {
     "duration": 0.162396,
     "end_time": "2022-01-26T03:26:50.571387",
     "exception": false,
     "start_time": "2022-01-26T03:26:50.408991",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Next: visualize distribution of aberrant trip durations: negative or over a day"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "0ef348b8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:26:50.901938Z",
     "iopub.status.busy": "2022-01-26T03:26:50.900193Z",
     "iopub.status.idle": "2022-01-26T03:26:52.097952Z",
     "shell.execute_reply": "2022-01-26T03:26:52.096752Z"
    },
    "papermill": {
     "duration": 1.365216,
     "end_time": "2022-01-26T03:26:52.098141",
     "exception": false,
     "start_time": "2022-01-26T03:26:50.732925",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'ride_duration_segment'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nSbJEbbQLke6yaxe33xFCFK2WzSa6TEiGR1p3f6R1dyGEPTFyy7cLe740Zt1Hzy5/I+GFAlzr\nAgAAt2GLnVzfD1+fdoJz9uu7hRB1hlfN3YBHF3b/4la83rfKvFbFU09PuGNJfffGr5PljOa0\nx6yKNOuMJVO3OiFE7NmTOUqlNZXrXcjXlnj+nb13Uk+3JZ5989A9SWMYHiHrm2sXc+TXFSpU\nqPHY31sNtT4FW/V6b1aFEKfTuSnKksWyAAAgpyh2cl39qd+rn29xnaLXaYtZ9FbzKaejDP61\nFzxVIqdDJd07v2hMr0deXS2E6PPVTwX/up6Ya3+1fa+Ou/PXlSSiTv7Qrs8GOWNK2oAyJq3d\nem3Rib/PD7f/2+ktnl0vhLAnpj//nNP+j2dXfv/TdkKIOW06bDj1cHc6W8LFd9s+eT3JVuKp\neY8GpL82WhZMIa2ir1w6/sesMWtTndnuxPqxl2IkSdc7w26LAAAgL/gqVq4hferPGtjiy3eL\n1YgIvfDnyagku1Yf9uHGn+Vc5vW5OjVSTgiSFB91/WZkssMpaYwvTNmwoFPplNnK9ZxaeniT\ny2cXli66u1njqok3Tu09cMLuW72636kL2QfUfP324w0n7HilZonFzZsV9U0+c/LwsQsJXd8a\nfubjj27vebHfwOc+mzPbRyNpjSWNGin+5mdPdb5TvMjLC2c3TzdQmeeXT//xxJvL9rWtGl6s\nYs2ygZZDh0/H2xxB5Tv88m0v2S+YEEJo9AXXjW7eYOyvEztWn1++ZrXS4XGRVw4eu+BwOluM\n/CXdV9sAACCP2GInV98523+bP6JuEc2pI6fsAYWadxmw/sj5Nx8vlP2SQlw+ezrFlTtx4cXL\nd+j75g+Hri97u1nq2QyBDQ8fWtOvbcNA66UNa1Zv++O4tlijJft2RPjI2kjWYPzW9Z++U79S\n2MHtGzbsOORXoeX3h68s/+jDOX2a+Gvurl71o80phBAaXdivk18uWcB309rvfzuW6dGp0htf\nH9myZNLTDSubb57afexaaIVHB4yZf/LE95XkHWiS2mNjftm1bEr7xnWcd8/v2Lrj9HXzYy27\nzv3h8KYPW+V0KAAAkDXJ6XTTNe3Va0ixgDk34w/FW2v75eBbyDyyJdy/dMNctmIJbfbzAgAA\nCMFXsV5L5xdWoWKYp1MAAIB/E76KBQAAUAmKHQAAgErwVWz2Xpg6t5Y5uaSRvd0AAIBX4+AJ\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# visualize distribution of aberrant trip durations - negative or over a day\n",
    "\n",
    "divvy_trips %>% \n",
    "  filter( ride_duration_sec < 0 | ride_duration_sec > 60*60*24) %>% \n",
    "\n",
    "  mutate( year_month = sprintf( '%d-%02d',\n",
    "                                year(started_at), month(started_at))) %>% \n",
    "\n",
    "  mutate( ride_duration_segment = case_when(\n",
    "    ride_duration_sec < 0 ~ \" < 0\",\n",
    "    ride_duration_sec < 60 ~ \"< 1m\",\n",
    "    ride_duration_sec < 60*60 ~ \"< 60m\",\n",
    "    ride_duration_sec < 60*60*3 ~ \"< 3h\",\n",
    "    ride_duration_sec < 60*60*24 ~ \"< 1d\",\n",
    "    ride_duration_sec >= 60*60*24 ~ \">= 1d\",\n",
    "    TRUE ~ \"all other\")) %>% \n",
    "  \n",
    "  group_by( ride_duration_segment, year_month) %>% \n",
    "\n",
    "  summarise(\n",
    "    tripsK = n() / 1000\n",
    "    # ,'percent trips' = sprintf( '%0.2f%%', tripsK /\n",
    "    #                              nrow(divvy_trips) * 100)\n",
    "  ) %>%\n",
    "  \n",
    "  arrange( ride_duration_segment, year_month)  %>%\n",
    "  \n",
    "  ggplot( aes( x = year_month, y = tripsK, fill = ride_duration_segment)) +\n",
    "    labs( x = \"date\",\n",
    "        y = \"number of rides (thousands)\",\n",
    "        fill = \"ride duration\") +\n",
    "    labs( title   = \"Trip Durations\",\n",
    "          caption = sprintf( \n",
    "            \"Data: Divvy Bikes (City of Chicago). Dates: from %s to %s.\",\n",
    "            format( min( divvy_trips$started_at), \"%D\"),\n",
    "            format( max( divvy_trips$started_at), \"%D\")\n",
    "            )\n",
    "          ) +\n",
    "    theme(axis.text.x = element_text(angle = 60, vjust = 1.0, hjust=1)) +\n",
    "    geom_col( position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fed8db55",
   "metadata": {
    "papermill": {
     "duration": 0.165255,
     "end_time": "2022-01-26T03:26:52.431798",
     "exception": false,
     "start_time": "2022-01-26T03:26:52.266543",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The viz above tells us there's an unusually high number of trips with negative durations in 2020. Trips over a day are more evenly spread. While neither trip type is statistically significant (under a percent each), either one is likely aberrant, or not a legitimate trip type:\n",
    "\n",
    "* either the bike was not docked properly (in case of durations over a day),\n",
    "* or the data was not recorded correctly (when the duration is negative)\n",
    "\n",
    "In either case presence of large negative or positive duration values may skew statistical calculations and either type should probably be excluded."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "87dc4bac",
   "metadata": {
    "papermill": {
     "duration": 0.16427,
     "end_time": "2022-01-26T03:26:52.759858",
     "exception": false,
     "start_time": "2022-01-26T03:26:52.595588",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Next: check rider types to ensure no abberant values and percent of total trips by each type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "169240e1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:26:53.097451Z",
     "iopub.status.busy": "2022-01-26T03:26:53.095754Z",
     "iopub.status.idle": "2022-01-26T03:26:53.228029Z",
     "shell.execute_reply": "2022-01-26T03:26:53.226506Z"
    },
    "papermill": {
     "duration": 0.303235,
     "end_time": "2022-01-26T03:26:53.228204",
     "exception": false,
     "start_time": "2022-01-26T03:26:52.924969",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>count</th><th scope=col>percent</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>2470517</td><td>45.93%</td></tr>\n",
       "\t<tr><td>member</td><td>2908317</td><td>54.07%</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & count & percent\\\\\n",
       " <chr> & <int> & <chr>\\\\\n",
       "\\hline\n",
       "\t casual & 2470517 & 45.93\\%\\\\\n",
       "\t member & 2908317 & 54.07\\%\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | count &lt;int&gt; | percent &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| casual | 2470517 | 45.93% |\n",
       "| member | 2908317 | 54.07% |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual count   percent\n",
       "1 casual        2470517 45.93% \n",
       "2 member        2908317 54.07% "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# table(divvy_trips$member_casual)\n",
    "\n",
    "divvy_trips %>% \n",
    "  group_by( member_casual) %>% \n",
    "  summarise(\n",
    "    count = n(),\n",
    "    percent = sprintf( '%0.2f%%', count / nrow( divvy_trips) * 100)\n",
    "  )\n",
    "\n",
    "# if there are aberrant / unexpected values, we'd need to use mutate / recode\n",
    "# to convert them for further analysis"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "800ca037",
   "metadata": {
    "papermill": {
     "duration": 0.165615,
     "end_time": "2022-01-26T03:26:53.560829",
     "exception": false,
     "start_time": "2022-01-26T03:26:53.395214",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "No apparent issues with the data above."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c605be48",
   "metadata": {
    "papermill": {
     "duration": 0.166043,
     "end_time": "2022-01-26T03:26:53.897133",
     "exception": false,
     "start_time": "2022-01-26T03:26:53.731090",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Next: checking `rideable_type` values for anything unusual"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "9c2ac2c5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:26:54.267682Z",
     "iopub.status.busy": "2022-01-26T03:26:54.265329Z",
     "iopub.status.idle": "2022-01-26T03:26:54.407883Z",
     "shell.execute_reply": "2022-01-26T03:26:54.406298Z"
    },
    "papermill": {
     "duration": 0.340076,
     "end_time": "2022-01-26T03:26:54.408052",
     "exception": false,
     "start_time": "2022-01-26T03:26:54.067976",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>rideable_type</th><th scope=col>count</th><th scope=col>percent</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>classic_bike </td><td>3066970</td><td>57.02%</td></tr>\n",
       "\t<tr><td>docked_bike  </td><td> 464387</td><td>8.63% </td></tr>\n",
       "\t<tr><td>electric_bike</td><td>1847477</td><td>34.35%</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 3\n",
       "\\begin{tabular}{lll}\n",
       " rideable\\_type & count & percent\\\\\n",
       " <chr> & <int> & <chr>\\\\\n",
       "\\hline\n",
       "\t classic\\_bike  & 3066970 & 57.02\\%\\\\\n",
       "\t docked\\_bike   &  464387 & 8.63\\% \\\\\n",
       "\t electric\\_bike & 1847477 & 34.35\\%\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 3\n",
       "\n",
       "| rideable_type &lt;chr&gt; | count &lt;int&gt; | percent &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| classic_bike  | 3066970 | 57.02% |\n",
       "| docked_bike   |  464387 | 8.63%  |\n",
       "| electric_bike | 1847477 | 34.35% |\n",
       "\n"
      ],
      "text/plain": [
       "  rideable_type count   percent\n",
       "1 classic_bike  3066970 57.02% \n",
       "2 docked_bike    464387 8.63%  \n",
       "3 electric_bike 1847477 34.35% "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "divvy_trips %>% \n",
    "  group_by( rideable_type) %>% \n",
    "  summarise(\n",
    "    count = n(),\n",
    "    percent = sprintf( '%0.2f%%', count / nrow( divvy_trips) * 100)\n",
    "  )"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "da1b4148",
   "metadata": {
    "papermill": {
     "duration": 0.172746,
     "end_time": "2022-01-26T03:26:54.749547",
     "exception": false,
     "start_time": "2022-01-26T03:26:54.576801",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The above tells us there's a significant number (8.63% for this dataset) of trips with \"docked_bike\" in the `rideable_type` field. We don't know what a \"docked_bike\" is and why there are trips with it. E.g. a \"docked_boat\" (in real life) normally doesn't float anywhere and if it does - call the police. Attempting to Google this or ask the dataset owner - no dice. Yet given the question we need to answer:\n",
    "\n",
    "> How do annual members and casual riders use Cyclistic bikes differently?\n",
    "\n",
    "... we shall not engage with this \"docked_bike\" mystery for now."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e9abdd6f",
   "metadata": {
    "papermill": {
     "duration": 0.176934,
     "end_time": "2022-01-26T03:26:55.097752",
     "exception": false,
     "start_time": "2022-01-26T03:26:54.920818",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Next: attempting to ID \"maintenance\" trips - made to/from \"maintenance\" stations"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "2a05b1da",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:26:55.446504Z",
     "iopub.status.busy": "2022-01-26T03:26:55.444558Z",
     "iopub.status.idle": "2022-01-26T03:27:02.104799Z",
     "shell.execute_reply": "2022-01-26T03:27:02.103113Z"
    },
    "papermill": {
     "duration": 6.834,
     "end_time": "2022-01-26T03:27:02.104964",
     "exception": false,
     "start_time": "2022-01-26T03:26:55.270964",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'start_station_name'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 19 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>start_station_name</th><th scope=col>end_station_name</th><th scope=col>trips</th><th scope=col>avg duration (minutes)</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>WATSON TESTING - DIVVY                </td><td>WATSON TESTING - DIVVY                </td><td>101</td><td>0.09    </td></tr>\n",
       "\t<tr><td>NA                                    </td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td> 12</td><td>16.74   </td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St                 </span></td><td><span style=white-space:pre-wrap>DIVVY CASSETTE REPAIR MOBILE STATION  </span></td><td><span style=white-space:pre-wrap>  4</span></td><td><span style=white-space:pre-wrap>38.40   </span></td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>DIVVY CASSETTE REPAIR MOBILE STATION  </span></td><td><span style=white-space:pre-wrap>Lake Shore Dr &amp; Monroe St             </span></td><td><span style=white-space:pre-wrap>  3</span></td><td><span style=white-space:pre-wrap>121.29  </span></td></tr>\n",
       "\t<tr><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>Artesian Ave &amp; Hubbard St             </span></td><td><span style=white-space:pre-wrap>  2</span></td><td><span style=white-space:pre-wrap>3.12    </span></td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>Marshfield Ave &amp; Cortland St          </span></td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>  2</span></td><td><span style=white-space:pre-wrap>12.28   </span></td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>St. Clair St &amp; Erie St                </span></td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>  2</span></td><td>13225.66</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>Calumet Ave &amp; 18th St                 </span></td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>  1</span></td><td><span style=white-space:pre-wrap>998.23  </span></td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>Clark St &amp; Elm St                     </span></td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>  1</span></td><td><span style=white-space:pre-wrap>609.22  </span></td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>Dayton St &amp; North Ave                 </span></td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>  1</span></td><td><span style=white-space:pre-wrap>16.30   </span></td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>Dearborn St &amp; Van Buren St            </span></td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>  1</span></td><td><span style=white-space:pre-wrap>17.03   </span></td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>Desplaines St &amp; Randolph St           </span></td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>  1</span></td><td><span style=white-space:pre-wrap>12.28   </span></td></tr>\n",
       "\t<tr><td>DIVVY CASSETTE REPAIR MOBILE STATION  </td><td>Field Museum                          </td><td>  1</td><td>13.43   </td></tr>\n",
       "\t<tr><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td>  1</td><td>2.17    </td></tr>\n",
       "\t<tr><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>Wood St &amp; Chicago Ave                 </span></td><td><span style=white-space:pre-wrap>  1</span></td><td><span style=white-space:pre-wrap>4.10    </span></td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>Lake Shore Dr &amp; Monroe St             </span></td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>  1</span></td><td>5157.37 </td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>Southport Ave &amp; Wrightwood Ave        </span></td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>  1</span></td><td>1247.00 </td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave                </span></td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>  1</span></td><td><span style=white-space:pre-wrap>13.45   </span></td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>Wood St &amp; Taylor St (Temp)            </span></td><td>HUBBARD ST BIKE CHECKING (LBS-WH-TEST)</td><td><span style=white-space:pre-wrap>  1</span></td><td><span style=white-space:pre-wrap>13.03   </span></td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 19 × 4\n",
       "\\begin{tabular}{llll}\n",
       " start\\_station\\_name & end\\_station\\_name & trips & avg duration (minutes)\\\\\n",
       " <chr> & <chr> & <int> & <chr>\\\\\n",
       "\\hline\n",
       "\t WATSON TESTING - DIVVY                 & WATSON TESTING - DIVVY                 & 101 & 0.09    \\\\\n",
       "\t NA                                     & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &  12 & 16.74   \\\\\n",
       "\t Michigan Ave \\& Oak St                  & DIVVY CASSETTE REPAIR MOBILE STATION   &   4 & 38.40   \\\\\n",
       "\t DIVVY CASSETTE REPAIR MOBILE STATION   & Lake Shore Dr \\& Monroe St              &   3 & 121.29  \\\\\n",
       "\t HUBBARD ST BIKE CHECKING (LBS-WH-TEST) & Artesian Ave \\& Hubbard St              &   2 & 3.12    \\\\\n",
       "\t Marshfield Ave \\& Cortland St           & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &   2 & 12.28   \\\\\n",
       "\t St. Clair St \\& Erie St                 & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &   2 & 13225.66\\\\\n",
       "\t Calumet Ave \\& 18th St                  & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &   1 & 998.23  \\\\\n",
       "\t Clark St \\& Elm St                      & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &   1 & 609.22  \\\\\n",
       "\t Dayton St \\& North Ave                  & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &   1 & 16.30   \\\\\n",
       "\t Dearborn St \\& Van Buren St             & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &   1 & 17.03   \\\\\n",
       "\t Desplaines St \\& Randolph St            & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &   1 & 12.28   \\\\\n",
       "\t DIVVY CASSETTE REPAIR MOBILE STATION   & Field Museum                           &   1 & 13.43   \\\\\n",
       "\t HUBBARD ST BIKE CHECKING (LBS-WH-TEST) & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &   1 & 2.17    \\\\\n",
       "\t HUBBARD ST BIKE CHECKING (LBS-WH-TEST) & Wood St \\& Chicago Ave                  &   1 & 4.10    \\\\\n",
       "\t Lake Shore Dr \\& Monroe St              & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &   1 & 5157.37 \\\\\n",
       "\t Southport Ave \\& Wrightwood Ave         & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &   1 & 1247.00 \\\\\n",
       "\t Wabash Ave \\& Grand Ave                 & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &   1 & 13.45   \\\\\n",
       "\t Wood St \\& Taylor St (Temp)             & HUBBARD ST BIKE CHECKING (LBS-WH-TEST) &   1 & 13.03   \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 19 × 4\n",
       "\n",
       "| start_station_name &lt;chr&gt; | end_station_name &lt;chr&gt; | trips &lt;int&gt; | avg duration (minutes) &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| WATSON TESTING - DIVVY                 | WATSON TESTING - DIVVY                 | 101 | 0.09     |\n",
       "| NA                                     | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |  12 | 16.74    |\n",
       "| Michigan Ave &amp; Oak St                  | DIVVY CASSETTE REPAIR MOBILE STATION   |   4 | 38.40    |\n",
       "| DIVVY CASSETTE REPAIR MOBILE STATION   | Lake Shore Dr &amp; Monroe St              |   3 | 121.29   |\n",
       "| HUBBARD ST BIKE CHECKING (LBS-WH-TEST) | Artesian Ave &amp; Hubbard St              |   2 | 3.12     |\n",
       "| Marshfield Ave &amp; Cortland St           | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |   2 | 12.28    |\n",
       "| St. Clair St &amp; Erie St                 | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |   2 | 13225.66 |\n",
       "| Calumet Ave &amp; 18th St                  | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |   1 | 998.23   |\n",
       "| Clark St &amp; Elm St                      | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |   1 | 609.22   |\n",
       "| Dayton St &amp; North Ave                  | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |   1 | 16.30    |\n",
       "| Dearborn St &amp; Van Buren St             | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |   1 | 17.03    |\n",
       "| Desplaines St &amp; Randolph St            | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |   1 | 12.28    |\n",
       "| DIVVY CASSETTE REPAIR MOBILE STATION   | Field Museum                           |   1 | 13.43    |\n",
       "| HUBBARD ST BIKE CHECKING (LBS-WH-TEST) | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |   1 | 2.17     |\n",
       "| HUBBARD ST BIKE CHECKING (LBS-WH-TEST) | Wood St &amp; Chicago Ave                  |   1 | 4.10     |\n",
       "| Lake Shore Dr &amp; Monroe St              | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |   1 | 5157.37  |\n",
       "| Southport Ave &amp; Wrightwood Ave         | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |   1 | 1247.00  |\n",
       "| Wabash Ave &amp; Grand Ave                 | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |   1 | 13.45    |\n",
       "| Wood St &amp; Taylor St (Temp)             | HUBBARD ST BIKE CHECKING (LBS-WH-TEST) |   1 | 13.03    |\n",
       "\n"
      ],
      "text/plain": [
       "   start_station_name                    \n",
       "1  WATSON TESTING - DIVVY                \n",
       "2  NA                                    \n",
       "3  Michigan Ave & Oak St                 \n",
       "4  DIVVY CASSETTE REPAIR MOBILE STATION  \n",
       "5  HUBBARD ST BIKE CHECKING (LBS-WH-TEST)\n",
       "6  Marshfield Ave & Cortland St          \n",
       "7  St. Clair St & Erie St                \n",
       "8  Calumet Ave & 18th St                 \n",
       "9  Clark St & Elm St                     \n",
       "10 Dayton St & North Ave                 \n",
       "11 Dearborn St & Van Buren St            \n",
       "12 Desplaines St & Randolph St           \n",
       "13 DIVVY CASSETTE REPAIR MOBILE STATION  \n",
       "14 HUBBARD ST BIKE CHECKING (LBS-WH-TEST)\n",
       "15 HUBBARD ST BIKE CHECKING (LBS-WH-TEST)\n",
       "16 Lake Shore Dr & Monroe St             \n",
       "17 Southport Ave & Wrightwood Ave        \n",
       "18 Wabash Ave & Grand Ave                \n",
       "19 Wood St & Taylor St (Temp)            \n",
       "   end_station_name                       trips avg duration (minutes)\n",
       "1  WATSON TESTING - DIVVY                 101   0.09                  \n",
       "2  HUBBARD ST BIKE CHECKING (LBS-WH-TEST)  12   16.74                 \n",
       "3  DIVVY CASSETTE REPAIR MOBILE STATION     4   38.40                 \n",
       "4  Lake Shore Dr & Monroe St                3   121.29                \n",
       "5  Artesian Ave & Hubbard St                2   3.12                  \n",
       "6  HUBBARD ST BIKE CHECKING (LBS-WH-TEST)   2   12.28                 \n",
       "7  HUBBARD ST BIKE CHECKING (LBS-WH-TEST)   2   13225.66              \n",
       "8  HUBBARD ST BIKE CHECKING (LBS-WH-TEST)   1   998.23                \n",
       "9  HUBBARD ST BIKE CHECKING (LBS-WH-TEST)   1   609.22                \n",
       "10 HUBBARD ST BIKE CHECKING (LBS-WH-TEST)   1   16.30                 \n",
       "11 HUBBARD ST BIKE CHECKING (LBS-WH-TEST)   1   17.03                 \n",
       "12 HUBBARD ST BIKE CHECKING (LBS-WH-TEST)   1   12.28                 \n",
       "13 Field Museum                             1   13.43                 \n",
       "14 HUBBARD ST BIKE CHECKING (LBS-WH-TEST)   1   2.17                  \n",
       "15 Wood St & Chicago Ave                    1   4.10                  \n",
       "16 HUBBARD ST BIKE CHECKING (LBS-WH-TEST)   1   5157.37               \n",
       "17 HUBBARD ST BIKE CHECKING (LBS-WH-TEST)   1   1247.00               \n",
       "18 HUBBARD ST BIKE CHECKING (LBS-WH-TEST)   1   13.45                 \n",
       "19 HUBBARD ST BIKE CHECKING (LBS-WH-TEST)   1   13.03                 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# attempting to ID \"maintenance\" trips - those made to/from \"maintenance\" stations\n",
    "# they could be \"HQ QR\", stations containing \"test\" or \"divvy\" in the name\n",
    "\n",
    "divvy_trips %>% \n",
    "  filter( \n",
    "    grepl( 'test|repair', start_station_name, ignore.case = TRUE) |\n",
    "      grepl( 'test|repair', end_station_name, ignore.case = TRUE)\n",
    "    ) %>% \n",
    "  group_by( start_station_name, end_station_name) %>% \n",
    "  summarise(\n",
    "    trips = n(),\n",
    "    'avg duration (minutes)' = sprintf( '%0.2f', mean( ride_duration_sec) / 60)\n",
    "  ) %>% \n",
    "  arrange( desc(trips))\n",
    "\n",
    "\n",
    "# this identifies a number of trips to/from stations that look like\n",
    "# maintenance stations, where these trips should perhaps be ignored"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3ab8b5ca",
   "metadata": {
    "papermill": {
     "duration": 0.182958,
     "end_time": "2022-01-26T03:27:02.471105",
     "exception": false,
     "start_time": "2022-01-26T03:27:02.288147",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The above tells us that most of the trips found through this search are very low in duration and unlikely to be real trips made by customers - in addition to them being to/from a \"testing\" station. We shall exclude them going forward."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fdd920a0",
   "metadata": {
    "papermill": {
     "duration": 0.173295,
     "end_time": "2022-01-26T03:27:02.822985",
     "exception": false,
     "start_time": "2022-01-26T03:27:02.649690",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Next: Removing \"testing\" and \"repair\" trips, and those under 60 seconds."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "4adc9c69",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:27:03.184864Z",
     "iopub.status.busy": "2022-01-26T03:27:03.183400Z",
     "iopub.status.idle": "2022-01-26T03:27:12.512713Z",
     "shell.execute_reply": "2022-01-26T03:27:12.510349Z"
    },
    "papermill": {
     "duration": 9.512196,
     "end_time": "2022-01-26T03:27:12.513161",
     "exception": false,
     "start_time": "2022-01-26T03:27:03.000965",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# drop rows with duration < 60 seconds and to/from test stations\n",
    "\n",
    "divvy_trips <- divvy_trips %>% \n",
    "  filter(\n",
    "    ride_duration_sec >= 60 &\n",
    "    !(grepl( 'test|repair', start_station_name, ignore.case = TRUE) |\n",
    "      grepl( 'test|repair', end_station_name, ignore.case = TRUE))\n",
    "    )\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8f71c195",
   "metadata": {
    "papermill": {
     "duration": 0.176675,
     "end_time": "2022-01-26T03:27:12.865532",
     "exception": false,
     "start_time": "2022-01-26T03:27:12.688857",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Next: data quality check: distribution of trips over months"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "0c99e42a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:27:13.227516Z",
     "iopub.status.busy": "2022-01-26T03:27:13.225096Z",
     "iopub.status.idle": "2022-01-26T03:27:18.266437Z",
     "shell.execute_reply": "2022-01-26T03:27:18.265064Z"
    },
    "papermill": {
     "duration": 5.222678,
     "end_time": "2022-01-26T03:27:18.266649",
     "exception": false,
     "start_time": "2022-01-26T03:27:13.043971",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 12 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>year_month</th><th scope=col>trips</th><th scope=col>percent of all trips</th><th scope=col>avg duration (minutes)</th><th scope=col>percent total duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2020-11</td><td>255137</td><td>4.82% </td><td>19.93</td><td>4.20% </td></tr>\n",
       "\t<tr><td>2020-12</td><td>129493</td><td>2.44% </td><td>16.17</td><td>1.73% </td></tr>\n",
       "\t<tr><td>2021-01</td><td> 95415</td><td>1.80% </td><td>15.49</td><td>1.22% </td></tr>\n",
       "\t<tr><td>2021-02</td><td> 48649</td><td>0.92% </td><td>24.90</td><td>1.00% </td></tr>\n",
       "\t<tr><td>2021-03</td><td>225523</td><td>4.26% </td><td>23.16</td><td>4.32% </td></tr>\n",
       "\t<tr><td>2021-04</td><td>332422</td><td>6.28% </td><td>24.48</td><td>6.73% </td></tr>\n",
       "\t<tr><td>2021-05</td><td>523243</td><td>9.88% </td><td>26.45</td><td>11.44%</td></tr>\n",
       "\t<tr><td>2021-06</td><td>717699</td><td>13.55%</td><td>26.51</td><td>15.73%</td></tr>\n",
       "\t<tr><td>2021-07</td><td>809752</td><td>15.29%</td><td>24.58</td><td>16.46%</td></tr>\n",
       "\t<tr><td>2021-08</td><td>792943</td><td>14.97%</td><td>21.94</td><td>14.38%</td></tr>\n",
       "\t<tr><td>2021-09</td><td>745185</td><td>14.07%</td><td>20.81</td><td>12.82%</td></tr>\n",
       "\t<tr><td>2021-10</td><td>621289</td><td>11.73%</td><td>19.39</td><td>9.96% </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 12 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " year\\_month & trips & percent of all trips & avg duration (minutes) & percent total duration\\\\\n",
       " <chr> & <int> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 2020-11 & 255137 & 4.82\\%  & 19.93 & 4.20\\% \\\\\n",
       "\t 2020-12 & 129493 & 2.44\\%  & 16.17 & 1.73\\% \\\\\n",
       "\t 2021-01 &  95415 & 1.80\\%  & 15.49 & 1.22\\% \\\\\n",
       "\t 2021-02 &  48649 & 0.92\\%  & 24.90 & 1.00\\% \\\\\n",
       "\t 2021-03 & 225523 & 4.26\\%  & 23.16 & 4.32\\% \\\\\n",
       "\t 2021-04 & 332422 & 6.28\\%  & 24.48 & 6.73\\% \\\\\n",
       "\t 2021-05 & 523243 & 9.88\\%  & 26.45 & 11.44\\%\\\\\n",
       "\t 2021-06 & 717699 & 13.55\\% & 26.51 & 15.73\\%\\\\\n",
       "\t 2021-07 & 809752 & 15.29\\% & 24.58 & 16.46\\%\\\\\n",
       "\t 2021-08 & 792943 & 14.97\\% & 21.94 & 14.38\\%\\\\\n",
       "\t 2021-09 & 745185 & 14.07\\% & 20.81 & 12.82\\%\\\\\n",
       "\t 2021-10 & 621289 & 11.73\\% & 19.39 & 9.96\\% \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 12 × 5\n",
       "\n",
       "| year_month &lt;chr&gt; | trips &lt;int&gt; | percent of all trips &lt;chr&gt; | avg duration (minutes) &lt;chr&gt; | percent total duration &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 2020-11 | 255137 | 4.82%  | 19.93 | 4.20%  |\n",
       "| 2020-12 | 129493 | 2.44%  | 16.17 | 1.73%  |\n",
       "| 2021-01 |  95415 | 1.80%  | 15.49 | 1.22%  |\n",
       "| 2021-02 |  48649 | 0.92%  | 24.90 | 1.00%  |\n",
       "| 2021-03 | 225523 | 4.26%  | 23.16 | 4.32%  |\n",
       "| 2021-04 | 332422 | 6.28%  | 24.48 | 6.73%  |\n",
       "| 2021-05 | 523243 | 9.88%  | 26.45 | 11.44% |\n",
       "| 2021-06 | 717699 | 13.55% | 26.51 | 15.73% |\n",
       "| 2021-07 | 809752 | 15.29% | 24.58 | 16.46% |\n",
       "| 2021-08 | 792943 | 14.97% | 21.94 | 14.38% |\n",
       "| 2021-09 | 745185 | 14.07% | 20.81 | 12.82% |\n",
       "| 2021-10 | 621289 | 11.73% | 19.39 | 9.96%  |\n",
       "\n"
      ],
      "text/plain": [
       "   year_month trips  percent of all trips avg duration (minutes)\n",
       "1  2020-11    255137 4.82%                19.93                 \n",
       "2  2020-12    129493 2.44%                16.17                 \n",
       "3  2021-01     95415 1.80%                15.49                 \n",
       "4  2021-02     48649 0.92%                24.90                 \n",
       "5  2021-03    225523 4.26%                23.16                 \n",
       "6  2021-04    332422 6.28%                24.48                 \n",
       "7  2021-05    523243 9.88%                26.45                 \n",
       "8  2021-06    717699 13.55%               26.51                 \n",
       "9  2021-07    809752 15.29%               24.58                 \n",
       "10 2021-08    792943 14.97%               21.94                 \n",
       "11 2021-09    745185 14.07%               20.81                 \n",
       "12 2021-10    621289 11.73%               19.39                 \n",
       "   percent total duration\n",
       "1  4.20%                 \n",
       "2  1.73%                 \n",
       "3  1.22%                 \n",
       "4  1.00%                 \n",
       "5  4.32%                 \n",
       "6  6.73%                 \n",
       "7  11.44%                \n",
       "8  15.73%                \n",
       "9  16.46%                \n",
       "10 14.38%                \n",
       "11 12.82%                \n",
       "12 9.96%                 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# confirm we're not missing any months\n",
    "\n",
    "divvy_trips %>% \n",
    "  \n",
    "  # mutate( 'day of week' = wday(started_at, label = TRUE)) %>% \n",
    "  # mutate( year = year(started_at)) %>% \n",
    "  # mutate( month = month(started_at)) %>% \n",
    "  mutate( year_month = sprintf( '%d-%02d', year(started_at), month(started_at))) %>% \n",
    "  group_by( year_month) %>%\n",
    "  summarise(\n",
    "    trips = n(),\n",
    "    'percent of all trips' = sprintf( '%0.2f%%', trips / nrow( divvy_trips) * 100),\n",
    "    'avg duration (minutes)' = sprintf( '%0.2f', mean( ride_duration_sec) / 60),\n",
    "    'percent total duration' =\n",
    "      sprintf( '%0.2f%%', sum( ride_duration_sec) / sum( divvy_trips$ride_duration_sec) * 100)\n",
    "  ) %>% View()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9c38c9cc",
   "metadata": {
    "papermill": {
     "duration": 0.182263,
     "end_time": "2022-01-26T03:27:18.630558",
     "exception": false,
     "start_time": "2022-01-26T03:27:18.448295",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The above tells us that there's not a month w/o data - i.e. nothing is obviosly missing - yet let's visualize this:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "d1ef8a5b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:27:19.005686Z",
     "iopub.status.busy": "2022-01-26T03:27:19.003875Z",
     "iopub.status.idle": "2022-01-26T03:27:23.927791Z",
     "shell.execute_reply": "2022-01-26T03:27:23.926022Z"
    },
    "papermill": {
     "duration": 5.116215,
     "end_time": "2022-01-26T03:27:23.927990",
     "exception": false,
     "start_time": "2022-01-26T03:27:18.811775",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nqqBRARgAwu690lXrTLl69xDCTVc/v+jtjRs1hhAeOOjU/779fwnMevJ3O37rtv7d+ku/3ePw\nn97dvYFi16yfHPXZ856dXb3ydhe9/fL/va88OITwo622vv7B17tvKRXm/eKYLS9+7IX2Ibt+\nZWhVX7d40o93DCFctP1Xbntq4QvOuha8cMIOn/93e9ea2132ifpsX1dYKiznq7heuXXfgy69\ns/uDg0tdc644Zstznp6Vqxv30+3WDCFUNW0z++UXH3+w+eSbH+95yFtP/P6UF+ckSWbvxV6f\n161Pe3fSoWNKxY49vrNXZ7G07YV7LnpXvx/2t1fS/694G6BRAagMg/223EHzno87ebficZsM\n6z4+PR930j7n3u5PEasatsEXv7rL5z+xYXUqydVtvFFtdvGPOxl/2VOLru7PO300hLDfs+/6\nHN0z124IIdy6yMedZPIfGb9KdQgh37j6xz++YUMuHULIVK199ZOzFn3gb4/dunu2tTf+xJaf\n//SoYVUhhHzDuNveWNCzTPfnbmxx1bO9OBLF8/bYKISQJOk11tvsMx/foPvDgRvW+cpTLe98\nsEhvPu6k0PlWPpUkSXbbr3/j24f/aSljvO/HnUzcZ3wIIdew+v98YqOmfDqEkM4O/dE973xS\nyf3f36Z7x1dZZ5MvbLXlxzdeJ5UkIYStjv/jB9y7bi1v/qp7/Zmqj87ofO+n0PXvYV/8WL3v\nx50sxxOpl6MCECVn7N5XcvIff1KfftfByQ0Z/8jDv913h/FDOl687be/+suDj6dXn3D1A3ev\nV93nc1pLks6vefcL/zx30t7rNRYef/SZVNMaO+x99N3PPb73+u96odtOP7z9kSkX77L1Jxa8\n+uTd9zw0f8i63zzyzIdf/tv2SzhrtSzJd6559M6rz/ji+PVb/vPUff98daXRnzj45MuffOI3\nY/r4JoBUZujtZ+3/kZVr7rj5N3/95xLfrLok+1x0118vP/Zjq6WeevSpQv3wLXc5+PeP/mvS\np9/5pJJPnfzHe68958tbbFZ68193//nup//d8qmtd7v4d4/ccfY2/bJ31cN2/vaqtSGEtb58\n6UqLvZO2fw/7BzxWS9ffzxAAKkZSKkXzP66XT9eCGS++1jJy3TXTy16WZTti9fqL/jP/4fkd\n42r7rZIB4EPIu2KXR6Z26Oh1hw72FAAA7+JXsQAAkRB2AACR8KtYBt83z71405bOj+S9ZBEA\n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\n5GrDzodM3vmQJQxXPeZdv4d9+zFbf+vorb/13pvzTWMPPuGsg3s5BwBAdHobdlVVVSGM+NKX\nRgzoNAAALLfeht0tt9wyoHMAAPAB9fY/Fdh8883P/ff8xW9/476JW3xhr34dCQCA5bGMM3Zz\nX/zX6x2FEMLf/va3kU899cyCIe++v/T4rdPu++tLAzUdAAC9toywu2m7T+737MIP8PzlNp/4\n5fstM2Ttw/p7KgAA+mwZYTf+tPMum90WQjj44IM/e/r5u6/83v+PNpWt3/zrOw/UdAAA9Noy\nwm693b61XgghhOuvv36n/fY/aERdGWYCAGA59PZdsX/5y18GdA4AAD6g3r4rFgCAFZywAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiERmsAcAWLaJEycO9gi90tzcPNgjAB9qztgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAEQiM9gDDI6hQ4eWc3NJkpR5i/2lrq6urq5usKfogyRJQgi5XK5CD3hT\nU9Ngj9A33Qe8urq6urp6sGdZIVToE69Cxw4VO7mxy6xCJ1/S2IVCYSmP+pCG3dy5c8uzoXw+\nX1VVVSqVyrbFfpEkyZAhQ0IIra2tnZ2dgz1OH9TU1GSz2a6urgULFgz2LH2QyWRqa2tDCPPn\nzy8Wi4M9Th/U19enUqn29vb29vbBnmWFUFlf6T0qdOxQsZMbu8wqdPKljN3Q0LCkuz6kYVe2\nWMlkMmXeYr/oPg0TQigUCpU1eXcVFYvFyhq7R2dnZ2WFXalUCpV8wPtdhR6HCh07VOzkxi6z\nCp18+cb2GjsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\n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\nTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "divvy_trips %>% \n",
    "  \n",
    "  # mutate( 'day of week' = wday(started_at, label = TRUE)) %>% \n",
    "  # mutate( year = year(started_at)) %>% \n",
    "  # mutate( month = month(started_at)) %>% \n",
    "  mutate( year_month = sprintf( '%d-%02d', year(started_at), month(started_at))) %>% \n",
    "  group_by( year_month) %>%\n",
    "  summarise( trips = n()) %>%\n",
    "\n",
    "  arrange( trips, year_month) %>% \n",
    "  \n",
    "  ggplot( aes( x = year_month, y = trips)) +\n",
    "  labs( x = \"month\",\n",
    "        y = \"trips\") +\n",
    "  labs( title   = \"Number of trips over time\",\n",
    "        caption = sprintf( \n",
    "          \"Data: Divvy Bikes (City of Chicago). Dates: from %s to %s.\",\n",
    "          format( min( divvy_trips$started_at), \"%D\"),\n",
    "          format( max( divvy_trips$started_at), \"%D\")\n",
    "          )\n",
    "        ) +\n",
    "\n",
    "  geom_col( position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "08b9e663",
   "metadata": {
    "papermill": {
     "duration": 0.186413,
     "end_time": "2022-01-26T03:27:24.299868",
     "exception": false,
     "start_time": "2022-01-26T03:27:24.113455",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The above bar graph shows the expected distribution of trips (rides) across a year, with rides sharply down in the winter, and picking up in the summer."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "30cbcb44",
   "metadata": {
    "papermill": {
     "duration": 0.182448,
     "end_time": "2022-01-26T03:27:24.669280",
     "exception": false,
     "start_time": "2022-01-26T03:27:24.486832",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### Conclusions for Step 3 (cleaning and preparation)\n",
    "\n",
    "There is a number of issues with the data and its collection:\n",
    "\n",
    "* A significant number of trips under a minute in duration. Those between 0 and 60 seconds likely indicate inadvertent or deliberate \"redocking\" to make sure the bike is marked as \"returned\" in the system. Yet those with negative duration (under a percent) indicate simply bad data.\n",
    "* A significant number of trips with `NA` (about a percent) for a starting and/or ending station.\n",
    "* A number of trips with durations over a day - very unlikely to be legitimate trips.\n",
    "* A sigificant number of trips where `rideable_type` aka \"bicycle type\" is `docked_bike` - which we know nothing about (unlike `classic_bike` and `electric_bike`) and which doesn't seem to be mentioned anywhere in the documentation.\n",
    "* There are *three* options for riders: single ride, [day pass](https://ride.divvybikes.com/pricing/24-hour-pass/kiosk-instructions) (aka [\"Explorer Pass\"](https://chi.streetsblog.org/2018/01/24/divvy-finally-introduces-3-single-ride-option-45-minute-time-limit-for-members/), and annual pass (aka \"members\") - yet only two corresponding values in the dataset (\"casual\" and \"member\"). The same is true for the [\"cleaned data\"](https://ride.divvybikes.com/system-data) (2013-2019). It is likely that single rides and day passes are bundled together into \"casual\" in the dataset - yet regardless, this means some of the data that is key to our business task (\"How do annual members and casual riders use bikes differently?\") may be missing.\n",
    "\n",
    "At this point, we can't be sure we can trust the data - only *assume* some of it may be OK. The best course of action from here is to engage with the dataset owner to get more information on how the data was collected, and how to remove bad data. Yet for this exercise (a capstone project done by thousands of aspiring data analysts) - would it make sense to bug dataset owners? Probably not. I tried anyway: no response.\n",
    "\n",
    "To sum up: **does the data [\"ROCCC\"](https://www.coursera.org/lecture/data-preparation/what-is-bad-data-lHirM)**?\n",
    "\n",
    "* Is it **R**eliable? Can't be sure - further analysis is needed to understand where the bad data comes from and how to deal with it.\n",
    "* Is it **O**riginal? **Yes**: comes directly from the service collecting the data, per dataset owners.\n",
    "* **C**omprehensive? **Not entirely** given there's *missing* data: a number of `NA` values for starting and ending stattions in the dataset.\n",
    "* **C**urrent? **Yes** for a specific timeframe - i.e. not outdated for the purpose of this analysis.\n",
    "* **C**ited: **unclear**: I have not found that the dataset owners or any 3rd party are vouching for the accuracy of their data - i.e. citing it. Rather, we see that they **had to clean their own data** in order to present it on their web site - without providing clear instructions, how.\n",
    "\n",
    "**Conclusion** (for cleaning and preparing steps): the data does not [\"ROCCC\"](https://www.coursera.org/lecture/data-preparation/what-is-bad-data-lHirM) (is not fully reliable) - yet **this is only an exercise**, not a real world project. We can thus ignore the data quality issues and proceed as if it is reliable."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e7ca155f",
   "metadata": {
    "papermill": {
     "duration": 0.18143,
     "end_time": "2022-01-26T03:27:25.030209",
     "exception": false,
     "start_time": "2022-01-26T03:27:24.848779",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Step 4: Analysis and Visualizations\n",
    "(i.e. identify trends and insights answering the \"business task\" at hand)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "da1a1b20",
   "metadata": {
    "papermill": {
     "duration": 0.183372,
     "end_time": "2022-01-26T03:27:25.400812",
     "exception": false,
     "start_time": "2022-01-26T03:27:25.217440",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Next: visualize average duration by user type over time"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "87155c58",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:27:25.767405Z",
     "iopub.status.busy": "2022-01-26T03:27:25.765763Z",
     "iopub.status.idle": "2022-01-26T03:27:32.416777Z",
     "shell.execute_reply": "2022-01-26T03:27:32.415544Z"
    },
    "papermill": {
     "duration": 6.836176,
     "end_time": "2022-01-26T03:27:32.416944",
     "exception": false,
     "start_time": "2022-01-26T03:27:25.580768",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nmnk5Vvl5kb1aNTnFSRtmKU+eSIg8IoRotueelNrJE/uHv6WxDzjwNF6SpNjQtSqVasLlpLP8\nTAPqVms36+KDvRP7DvgxaYbnfquqcy6bctG9cjvXXPhv0uSWHsXs9MX2PU72GagpoV+wh7N/\n+5e2w0tnEaa/juHXhgohFt5L+ngrsoabfemBR6S0z4p9ZZKXzoqt5mqf/KPYkKOd1BqXI89P\nmIh+sMDPz29DWFxar42wSwNVKu3W5x93Pj45WAjR+8qTdJJLknR+WlXXvENShk/O+tezlU9x\nci99FJu0AdNZTX+dpuX5x882y/mWWocCSXNL/0xSCz+KDTnWvfSgZ9tTMsYWdrR7a8q5Zxvq\nyWYhxMBkv03pPNZkiKjuZl+y14KXTxF61TxfWpf0n/FXrGMay0qe8872pmqt+4vrm5gS3vVw\nKPrpXqvWMa08yAkodlC+NWV9nf27m08k2LNr2+LpYyr7OroEvW8+QOrp7XFCiK8WbLtx+9q+\njfPeLxEghBh96IZBkmYW9sjz3rz79x+lc5+ou7/369dv85NUTp5IZ6FS8mInSZvbFHTMVcDB\n/Z2XroaV1vjRr8uoNXZJZ7mm9J+TJ/bu3bJmWefquez0wf/GJkqpFTuTIbyxjz6w/hTzwye/\nG+joW2PG0vWnjh+Y0Lua1iFoc1jck8sjhBDtR889cPz0wR1/f1LS06fCy0d6SZK0pUX+5L3K\nGH+/bTEPe49SQybO2bx955q/5nSpm1+tcRp/OOSl7ZC0tS1bR8OnRdxdCzRcsn7X8X1bhrQs\nprXPszM8Tkq72L0ySfrFzmSIbJbbybdKpzXbDx3bu75jaS/3Qt2l9F4/hs9KevpU7rJ+19E9\n6xfVL1hOCPHFlSfpJJckaXPjfEXa7zbfPv7j0K++/iXlilj/es7AU5zW6zytYpfOamZ1sVtR\nP8+s+y9OIz0ysobWIe+c9Qf+PbGzTyUft0KdDJY99smVvkKI8ctXrU1m864Hr5ynWbKtnd4z\n/sp1THVZyXMa4m5WcNHla9x3/c4DR/duHdWpotrOc/n9aCvXMa08ab0sYTsodlC+NWVffEqi\nUmk9/Qp+0GP0pagXJ5ptHNerSKC3g6tflXrtNlwM71Ypj9bO+WhkwoXpnbz0dq5526dzn3Qu\nd5L+QpMXu4hr3wshyn13/KWZpDVuvnJV5XGn01rll06eUOsci7390fqL4ckX/dJ17EKOjFap\nVF/vuS9JkjHh4Q+fNcvr6axz8ipdvdWSw8/K1oaJfUrn97XTaL1z53/vk0HnIhNSLvrh4fbJ\nL1YiSZIx/u7kQR1K58/loNU4ueeq2qD94oMv3jmStkPyrW3JOiZEnhv4cT0/N0etg3Opmi8u\nIZFWsXtlkvSLnSRJcaGH+rSsW8DP1cUnT+22g08+P5EirdeGIfbGNx/W8Xd18CtSbfHpi0mv\nk7SSS5L0sa+++6lnW3tJsJe9a7WUa5Epr+fXfYrTep2nXezSXM0sLXYmQ2Qx/8b/+bEp4ffB\nHwd5u9g5ulVp8tnRJ/EWPvbqstopP+PyLv73K+dplnxrp/OMv3odUywr5TqGX1rXtn4FD2cH\nJ6+AynU+XHDgQVrzfI11TCNPWi9L2A6VJGXCkaoAslPk7V/c8n2180l00rH8tkMyhJV0zz3l\nTkRdd3tr5mPL62gJQ+zFmXO2Ne/WM0CnFkJE35vpEtjz6NP48s5pHsYXF/aPe74Rj8KPuVhw\n3CQApIqTJ4AcRUqIN8TM7jzes/hI22w8Kq3nvC9KDPrFopP+Umfz62gJtZ3v3G++bDNi0Z1H\n4Q9vnPymzQjvssPSaXVCiJPjhpUZ+D9aHQBrUOyAnCQm5A8HO6dBe00/rugld5Y0VRi53mtW\nh+txFp33l1KOWMdXUms9tx5alHvv+DL5cxUs2+h87rbbd3+bzv0NMRc6/hGwbkiZbEsIQJH4\nKBbIUaSEi8dPOhQqG2Tbu7Ke/nvgul/FMi7p7aBKUw5Zx8yVEH78WGjhqgVd5A4CIGej2AEA\nACgEH8UCAAAoBMUOAABAISh2AAAACkGxAwAAUAiKHQAAgEJQ7AAAABSCYgcAAKAQ/wdDGI2H\nLbK8HAAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "divvy_trips %>% \n",
    "  # head(1000*1000) %>%\n",
    "  mutate( year_month = sprintf( '%d-%02d',\n",
    "                                year(started_at), month(started_at))) %>% \n",
    "\n",
    "  group_by( member_casual, year_month) %>% \n",
    "  \n",
    "  summarise( number_of_rides = n(),\n",
    "             avg_duration = mean(ride_duration_sec) / 60) %>% \n",
    "  arrange( member_casual, year_month)  %>% \n",
    "  \n",
    "  ggplot( aes( x = year_month, y = avg_duration, fill = member_casual)) +\n",
    "    labs( x = \"date\",\n",
    "        y = \"average duration (minutes)\",\n",
    "        fill = \"rider type\") +\n",
    "    labs( title   = \"Average duration by rider type\",\n",
    "          caption = sprintf( \n",
    "            \"Data: Divvy Bikes (City of Chicago). Dates: from %s to %s.\",\n",
    "            format( min( divvy_trips$started_at), \"%D\"),\n",
    "            format( max( divvy_trips$started_at), \"%D\")\n",
    "            )\n",
    "          ) +\n",
    "    theme(axis.text.x = element_text(angle = 60, vjust = 1.0, hjust=1)) +\n",
    "    geom_col( position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ee040964",
   "metadata": {
    "papermill": {
     "duration": 0.192213,
     "end_time": "2022-01-26T03:27:32.795758",
     "exception": false,
     "start_time": "2022-01-26T03:27:32.603545",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The above viz shows unusual, unexpected spike in trip duration for both casual riders and members in January 2021. Members' duration go back to baseline values while casual riders - stay higher until August.\n",
    "\n",
    "Could this indicate a data quality issue, possibly to do with bikes that haven't been properly docked and thus result in aberrant multi-day \"rides\"? Let's explore in the next code chunk."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "354c0059",
   "metadata": {
    "papermill": {
     "duration": 0.187383,
     "end_time": "2022-01-26T03:27:33.170140",
     "exception": false,
     "start_time": "2022-01-26T03:27:32.982757",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Next: same viz as above - except drop trips over a day (which may skew average durations significantly even if there are very few of them)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "806433f3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:27:33.554809Z",
     "iopub.status.busy": "2022-01-26T03:27:33.553106Z",
     "iopub.status.idle": "2022-01-26T03:27:40.235467Z",
     "shell.execute_reply": "2022-01-26T03:27:40.234204Z"
    },
    "papermill": {
     "duration": 6.873478,
     "end_time": "2022-01-26T03:27:40.235665",
     "exception": false,
     "start_time": "2022-01-26T03:27:33.362187",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\ntrRxDqzdeuHB5/tjbm79vUnlkk5aCxcvv+a9fwxP0qXf2uE3x1s5vvd8QhdXxFpTbfr5NPcJ\nPrL4p0m/pA6TemsbuI6J0ZeHf9rIy8nGXGtfrk7rladDJEn6uYijfj4WthVfubcBSTwt1G3P\nnh/e8l0HrbmTp1+3MWtSJ5QkKSHy/ND27xfzcrB2cH+v7ZCzkQn6O2T22kiIOj+4TcPCLtYu\nPmW+XX66vqNV/2vPMksuSZIkJVW2s5h2LzL9Vk3tjbyes/sUZ/g6T7O1nTRmv96+82Xruu7u\nH2axmp4W6pH//K98AWuVSlOgaNU5R4OPL/qqhIejhY1L1RYDn2RU92KfXD5x4sTRoD/TlIzM\nxiVJWvSOx9qnMdGPFgghZj2IShlv5GRV/tuThjw2Jnhl+fLlj0YkpIyvLuvmXOJ/WcwzRZqt\nnfkz/pp1zHpZ+pxxz3ZNmTIl7MUzFR9xRAjx1Y0wY9Yx68fCxFHsoHwZvhHe3/e+SqXSv4t8\n4e/oVrX3pn1H/j0WNH3Qu2ZquxuxSfEx0T8XdSzx2a7o6LjM7iNJUuS9OQMGDNgamna/12sX\nqq8LD4M6mam1V1+0lp0d/O0KfiFJUmbjUQ9+V6lU218sbmltL49q89Kvcg8PW89avwbp7d+7\nfMYIF0vt56tu6H+aptjFPj1Yx12b0uokSfr6nQJOpVsv3bz75JG9M4e3NlPbzLsaFh++305t\n1uTbuYdPnNq19jdvS3WNaWl7kiRJx4eV9aq9Xn9b/7Y0Ncumog+Temsbto7JvQKc7Ao3WLJ+\n59G9m4d/VEJj6bM/PD4xJnpFgEuR1tuio2NT39uQJJ4Wagdfz+Hz/7507fKanzsJIb6/E5GS\nUNLFd/F3cCnffu32oEO71rYLcHQuNUT/wExeG7oBpZ1dKny6YefhXRsW13TXWpqp+l97llly\n/ayWVXKv9MPpLEJKb+j1nN2nOMPXeZqt7aQxq90wcOyCTZeuP8xiNT0t1NY2pWZvPvjfhaP9\ny7uqLQoUfH/IoTNXD2+aYac2q7/iWmYrnhhzKcOSkX48OSG4sHdnSZJCLncUQpyNfvlfwdjC\nDl41thry2DTiQg8VstLUmXnxtfOUJOnVrZ3VM571umSxrPQ5H/yzfuHvU9pWdStU+4t4Xabz\nNGQds3gsTB/FDsqX4RthyOUOQoh/oxIkSfp50k9/Bz8/iCo2ZJMQYs3TtEd9ZXafHC9UXxeS\n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\njbuPngza0qWsi6N/Lymr109Sn0Bnt6rdt+w7cWDLsoZFKwghvrj2LIvkkiT907Rw8U779bdP\n/Tjyq69/Sb8ixr+ec/AUZ/Y6z6zYZbGauV3s1jQsOPfhy9NIj4+tpbEqtGDL4f/+3TugipuD\nf9ckwx777NpAIcTk1es3pfLPvkevnadeqq2d1TP+2nXMcFmpcybF3a5kZ1G46cAtew+fCNo5\nrmtlM3Pn1Q+jjVzHzPJk9rKE6aDYQfk2ln/5KYlKpXH2KPpx7/FXol6eaLZtUr/iPq5W9h7V\nGnTcejmsZ5WCGnPbE5EJl2Z1ddGa2xfqlMV9srjcSdYLTV3swm98L4So8N2pNDPJbFx/5aqq\nk85mtsppTp4ws7Au+e4nWy6HpV50muvYBR8fr1Kpvj7wUJKk5ITHP/T5qJCzrYWNS9marVcc\ne162tk4dUNbP3VytcfXya/zpsAuRCekX/fhYp9QXK5EkKTn+/vRhncv6FbDSqG0cC1R/v9Py\nIy/fOVK2Q+qtbcg6JkReGNqhgYeDtcbKtkztl5eQyKzYvTZJ1sVOkqS4kKMDWtUv4mFv51aw\nbvvhp1+cSJHZayMp9tY3bep52lt5FK+x/OzllNdJZsklSergru115vnWXhHgYmlfI/1avJHX\nc3af4sxe55kXu0xXM1eLnS4psqRn01d+rEuYP7yDr6udubVDtWZ9TjyLN/Cx11fVTf8Zl2up\nda+dp17qrZ3FM/76dUy3rPTrGHZlc/uGlZxsrWxcvKvWa7Pk8KPM5pmNdcwkT2YvS5gOlSS9\ngSNVAeSlyLu/OBT+au+z6JRj+U2HlBQa6Oj1673w+o6WxszHlNfREEmxl+cs2NWiZ19vCzMh\nRPSDOXY+fU9ExFe0zfQwvrjQvx0Lj3kSdtLOgOMmASBDnDwB5CtSQnxSzLxuk51LjTXNxqPS\nOC/6ovSwXww66S9jJr+OhjAzd1/4zZftxiy79yTs8a3T37Qb41p+VBatTghxetKockP/R6sD\nYAyKHZCfxAT/YWVuMyxI9+OafnJnyVSlsVtc5na+GWfQeX/p5Yt1fC0zjfPOo8u8giaX8ytQ\ntHyTi17td+//Nov7J8Vc6vKH9+YR5fIsIQBF4qNYIF+REi6fOm3lX97XtHdlRfx3+KZH5XJ2\nWe2gylQ+Wcc3KyHs1MmQYtWL2skdBED+RrEDAABQCD6KBQAAUAiKHQAAgEJQ7AAAABSCYgcA\nAKAQFDsAAACFoNgBAAAoBMUOAABAIf4P0MF67++nEEgAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# same viz as in the previous code chunk - except drop trips over a day\n",
    "\n",
    "divvy_trips %>% \n",
    "  # head(1000*1000) %>%\n",
    "  filter( ride_duration_sec <= 60*60*24) %>% \n",
    "  mutate( year_month = sprintf( '%d-%02d',\n",
    "                                year(started_at), month(started_at))) %>% \n",
    "\n",
    "  group_by( member_casual, year_month) %>% \n",
    "  \n",
    "  summarise( number_of_rides = n(),\n",
    "             avg_duration = mean(ride_duration_sec) / 60) %>% \n",
    "  arrange( member_casual, year_month)  %>% \n",
    "  \n",
    "  ggplot( aes( x = year_month, y = avg_duration, fill = member_casual)) +\n",
    "    labs( x = \"date\",\n",
    "        y = \"average duration (minutes)\",\n",
    "        fill = \"rider type\") +\n",
    "    labs( title   = \"Average duration by rider type (trips under 1 day in duration)\",\n",
    "          caption = sprintf( \n",
    "            \"Data: Divvy Bikes (City of Chicago). Dates: from %s to %s.\",\n",
    "            format( min( divvy_trips$started_at), \"%D\"),\n",
    "            format( max( divvy_trips$started_at), \"%D\")\n",
    "            )\n",
    "          ) +\n",
    "    theme(axis.text.x = element_text(angle = 60, vjust = 1.0, hjust=1)) +\n",
    "    geom_col( position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e2aea638",
   "metadata": {
    "papermill": {
     "duration": 0.194141,
     "end_time": "2022-01-26T03:27:40.624971",
     "exception": false,
     "start_time": "2022-01-26T03:27:40.430830",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The graph is quite a bit different!\n",
    "\n",
    "* average durations dropped significantly for casual riders - from the high of 50 minutes - to around 30\n",
    "* there is still a spike for \"members\" in January - although it's a smaller one\n",
    "\n",
    "**Conclusion**: we should drop trips over a day as likely aberrant, when analyzing trip durations - or find a way to vet (cite) the data to ensure its accuracy."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7f0d2a32",
   "metadata": {
    "papermill": {
     "duration": 0.188979,
     "end_time": "2022-01-26T03:27:41.006386",
     "exception": false,
     "start_time": "2022-01-26T03:27:40.817407",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* User type stats over \"day of the week\""
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "845e9183",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:27:41.388163Z",
     "iopub.status.busy": "2022-01-26T03:27:41.386777Z",
     "iopub.status.idle": "2022-01-26T03:27:49.174020Z",
     "shell.execute_reply": "2022-01-26T03:27:49.172752Z"
    },
    "papermill": {
     "duration": 7.980375,
     "end_time": "2022-01-26T03:27:49.174211",
     "exception": false,
     "start_time": "2022-01-26T03:27:41.193836",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'day of week'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>day of week</th><th scope=col>member_casual</th><th scope=col>trips</th><th scope=col>percent of all trips</th><th scope=col>avg duration (minutes)</th><th scope=col>percent total duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Sun</td><td>casual</td><td>469739</td><td>8.87% </td><td>38.56</td><td>14.98%</td></tr>\n",
       "\t<tr><td>Sun</td><td>member</td><td>361657</td><td>6.83% </td><td>16.21</td><td>4.85% </td></tr>\n",
       "\t<tr><td>Mon</td><td>casual</td><td>274566</td><td>5.18% </td><td>32.75</td><td>7.43% </td></tr>\n",
       "\t<tr><td>Mon</td><td>member</td><td>384943</td><td>7.27% </td><td>13.74</td><td>4.37% </td></tr>\n",
       "\t<tr><td>Tue</td><td>casual</td><td>260698</td><td>4.92% </td><td>29.00</td><td>6.25% </td></tr>\n",
       "\t<tr><td>Tue</td><td>member</td><td>424866</td><td>8.02% </td><td>13.30</td><td>4.67% </td></tr>\n",
       "\t<tr><td>Wed</td><td>casual</td><td>263815</td><td>4.98% </td><td>28.53</td><td>6.22% </td></tr>\n",
       "\t<tr><td>Wed</td><td>member</td><td>437383</td><td>8.26% </td><td>13.37</td><td>4.83% </td></tr>\n",
       "\t<tr><td>Thu</td><td>casual</td><td>273681</td><td>5.17% </td><td>28.58</td><td>6.47% </td></tr>\n",
       "\t<tr><td>Thu</td><td>member</td><td>418982</td><td>7.91% </td><td>13.30</td><td>4.61% </td></tr>\n",
       "\t<tr><td>Fri</td><td>casual</td><td>350192</td><td>6.61% </td><td>31.32</td><td>9.07% </td></tr>\n",
       "\t<tr><td>Fri</td><td>member</td><td>418224</td><td>7.90% </td><td>13.88</td><td>4.80% </td></tr>\n",
       "\t<tr><td>Sat</td><td>casual</td><td>544458</td><td>10.28%</td><td>35.62</td><td>16.03%</td></tr>\n",
       "\t<tr><td>Sat</td><td>member</td><td>413546</td><td>7.81% </td><td>15.83</td><td>5.41% </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 6\n",
       "\\begin{tabular}{llllll}\n",
       " day of week & member\\_casual & trips & percent of all trips & avg duration (minutes) & percent total duration\\\\\n",
       " <ord> & <chr> & <int> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t Sun & casual & 469739 & 8.87\\%  & 38.56 & 14.98\\%\\\\\n",
       "\t Sun & member & 361657 & 6.83\\%  & 16.21 & 4.85\\% \\\\\n",
       "\t Mon & casual & 274566 & 5.18\\%  & 32.75 & 7.43\\% \\\\\n",
       "\t Mon & member & 384943 & 7.27\\%  & 13.74 & 4.37\\% \\\\\n",
       "\t Tue & casual & 260698 & 4.92\\%  & 29.00 & 6.25\\% \\\\\n",
       "\t Tue & member & 424866 & 8.02\\%  & 13.30 & 4.67\\% \\\\\n",
       "\t Wed & casual & 263815 & 4.98\\%  & 28.53 & 6.22\\% \\\\\n",
       "\t Wed & member & 437383 & 8.26\\%  & 13.37 & 4.83\\% \\\\\n",
       "\t Thu & casual & 273681 & 5.17\\%  & 28.58 & 6.47\\% \\\\\n",
       "\t Thu & member & 418982 & 7.91\\%  & 13.30 & 4.61\\% \\\\\n",
       "\t Fri & casual & 350192 & 6.61\\%  & 31.32 & 9.07\\% \\\\\n",
       "\t Fri & member & 418224 & 7.90\\%  & 13.88 & 4.80\\% \\\\\n",
       "\t Sat & casual & 544458 & 10.28\\% & 35.62 & 16.03\\%\\\\\n",
       "\t Sat & member & 413546 & 7.81\\%  & 15.83 & 5.41\\% \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 6\n",
       "\n",
       "| day of week &lt;ord&gt; | member_casual &lt;chr&gt; | trips &lt;int&gt; | percent of all trips &lt;chr&gt; | avg duration (minutes) &lt;chr&gt; | percent total duration &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| Sun | casual | 469739 | 8.87%  | 38.56 | 14.98% |\n",
       "| Sun | member | 361657 | 6.83%  | 16.21 | 4.85%  |\n",
       "| Mon | casual | 274566 | 5.18%  | 32.75 | 7.43%  |\n",
       "| Mon | member | 384943 | 7.27%  | 13.74 | 4.37%  |\n",
       "| Tue | casual | 260698 | 4.92%  | 29.00 | 6.25%  |\n",
       "| Tue | member | 424866 | 8.02%  | 13.30 | 4.67%  |\n",
       "| Wed | casual | 263815 | 4.98%  | 28.53 | 6.22%  |\n",
       "| Wed | member | 437383 | 8.26%  | 13.37 | 4.83%  |\n",
       "| Thu | casual | 273681 | 5.17%  | 28.58 | 6.47%  |\n",
       "| Thu | member | 418982 | 7.91%  | 13.30 | 4.61%  |\n",
       "| Fri | casual | 350192 | 6.61%  | 31.32 | 9.07%  |\n",
       "| Fri | member | 418224 | 7.90%  | 13.88 | 4.80%  |\n",
       "| Sat | casual | 544458 | 10.28% | 35.62 | 16.03% |\n",
       "| Sat | member | 413546 | 7.81%  | 15.83 | 5.41%  |\n",
       "\n"
      ],
      "text/plain": [
       "   day of week member_casual trips  percent of all trips avg duration (minutes)\n",
       "1  Sun         casual        469739 8.87%                38.56                 \n",
       "2  Sun         member        361657 6.83%                16.21                 \n",
       "3  Mon         casual        274566 5.18%                32.75                 \n",
       "4  Mon         member        384943 7.27%                13.74                 \n",
       "5  Tue         casual        260698 4.92%                29.00                 \n",
       "6  Tue         member        424866 8.02%                13.30                 \n",
       "7  Wed         casual        263815 4.98%                28.53                 \n",
       "8  Wed         member        437383 8.26%                13.37                 \n",
       "9  Thu         casual        273681 5.17%                28.58                 \n",
       "10 Thu         member        418982 7.91%                13.30                 \n",
       "11 Fri         casual        350192 6.61%                31.32                 \n",
       "12 Fri         member        418224 7.90%                13.88                 \n",
       "13 Sat         casual        544458 10.28%               35.62                 \n",
       "14 Sat         member        413546 7.81%                15.83                 \n",
       "   percent total duration\n",
       "1  14.98%                \n",
       "2  4.85%                 \n",
       "3  7.43%                 \n",
       "4  4.37%                 \n",
       "5  6.25%                 \n",
       "6  4.67%                 \n",
       "7  6.22%                 \n",
       "8  4.83%                 \n",
       "9  6.47%                 \n",
       "10 4.61%                 \n",
       "11 9.07%                 \n",
       "12 4.80%                 \n",
       "13 16.03%                \n",
       "14 5.41%                 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "divvy_trips %>% \n",
    "  mutate( trip_type = case_when(\n",
    "    start_station_id == end_station_id ~ \"same to/from station\",\n",
    "    TRUE ~ \"different to/from stations\")) %>% \n",
    "  mutate( 'day of week' = wday(started_at, label = TRUE)) %>% \n",
    "  # group_by( trip_type, member_casual) %>% \n",
    "  # group_by( trip_type, rideable_type) %>%\n",
    "  # group_by( rideable_type) %>%\n",
    "  # group_by( trip_type) %>%\n",
    "  # group_by( `day of week`) %>%\n",
    "  group_by( `day of week`, member_casual) %>%\n",
    "  summarise(\n",
    "    trips = n(),\n",
    "    'percent of all trips' = sprintf( '%0.2f%%', trips / nrow( divvy_trips) * 100),\n",
    "    'avg duration (minutes)' = sprintf( '%0.2f', mean( ride_duration_sec) / 60),\n",
    "    'percent total duration' =\n",
    "      sprintf( '%0.2f%%', sum( ride_duration_sec) /\n",
    "                 sum( divvy_trips$ride_duration_sec) * 100)\n",
    "  )"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d920f2e9",
   "metadata": {
    "papermill": {
     "duration": 0.257584,
     "end_time": "2022-01-26T03:27:49.648040",
     "exception": false,
     "start_time": "2022-01-26T03:27:49.390456",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The table above is rather hard to read so let's visualize it"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b9ee2dff",
   "metadata": {
    "papermill": {
     "duration": 0.198294,
     "end_time": "2022-01-26T03:27:50.045710",
     "exception": false,
     "start_time": "2022-01-26T03:27:49.847416",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Visualize number of rides by rider type, by day of the week"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "5303ab62",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:27:50.440556Z",
     "iopub.status.busy": "2022-01-26T03:27:50.439076Z",
     "iopub.status.idle": "2022-01-26T03:27:56.960226Z",
     "shell.execute_reply": "2022-01-26T03:27:56.959133Z"
    },
    "papermill": {
     "duration": 6.718769,
     "end_time": "2022-01-26T03:27:56.960468",
     "exception": false,
     "start_time": "2022-01-26T03:27:50.241699",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Let's visualize the number of rides by rider type\n",
    "divvy_trips %>% \n",
    "  # head(100000) %>%\n",
    "  within( weekday <- wday( started_at, label = TRUE)) %>%\n",
    "\n",
    "  group_by( member_casual, weekday) %>%\n",
    "  \n",
    "  summarise( 'number of rides' = n() / 1000,\n",
    "    'avg duration' = mean( ride_duration_sec)\n",
    "    ) %>%\n",
    "  arrange( member_casual, weekday) %>% \n",
    "\n",
    "  \n",
    "  ggplot( aes( x = weekday, y = `number of rides`, fill = member_casual)) +\n",
    "  labs( x = \"day of the week\",\n",
    "        y = \"number of rides (thousands)\",\n",
    "        fill = \"rider type\") +\n",
    "  labs( title   = \"Number of rides by rider type\",\n",
    "        caption = sprintf( \n",
    "          \"Data: Divvy Bikes (City of Chicago). Dates: from %s to %s.\",\n",
    "          format( min( divvy_trips$started_at), \"%D\"),\n",
    "          format( max( divvy_trips$started_at), \"%D\")\n",
    "          )\n",
    "        ) +\n",
    "\n",
    "  geom_col( position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "957dc826",
   "metadata": {
    "papermill": {
     "duration": 0.199029,
     "end_time": "2022-01-26T03:27:57.355987",
     "exception": false,
     "start_time": "2022-01-26T03:27:57.156958",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* calculate *trips per day* on weekends / weekday and the difference between them"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "de9256e7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:27:57.757711Z",
     "iopub.status.busy": "2022-01-26T03:27:57.755914Z",
     "iopub.status.idle": "2022-01-26T03:28:05.500493Z",
     "shell.execute_reply": "2022-01-26T03:28:05.498386Z"
    },
    "papermill": {
     "duration": 7.945741,
     "end_time": "2022-01-26T03:28:05.500748",
     "exception": false,
     "start_time": "2022-01-26T03:27:57.555007",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 4 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>weekend</th><th scope=col>trips</th><th scope=col>percent of all trips</th><th scope=col>avg duration (minutes)</th><th scope=col>percent total duration</th><th scope=col>trips per day</th><th scope=col>percent per day per rider type</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;lgl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>FALSE</td><td>1422952</td><td>26.86%</td><td>30.13</td><td>35.44%</td><td>284590.4</td><td>35.95%</td></tr>\n",
       "\t<tr><td>casual</td><td> TRUE</td><td>1014197</td><td>19.15%</td><td>36.98</td><td>31.01%</td><td>507098.5</td><td>64.05%</td></tr>\n",
       "\t<tr><td>member</td><td>FALSE</td><td>2084398</td><td>39.35%</td><td>13.51</td><td>23.29%</td><td>416879.6</td><td>51.82%</td></tr>\n",
       "\t<tr><td>member</td><td> TRUE</td><td> 775203</td><td>14.64%</td><td>16.01</td><td>10.26%</td><td>387601.5</td><td>48.18%</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 4 × 8\n",
       "\\begin{tabular}{llllllll}\n",
       " member\\_casual & weekend & trips & percent of all trips & avg duration (minutes) & percent total duration & trips per day & percent per day per rider type\\\\\n",
       " <chr> & <lgl> & <int> & <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t casual & FALSE & 1422952 & 26.86\\% & 30.13 & 35.44\\% & 284590.4 & 35.95\\%\\\\\n",
       "\t casual &  TRUE & 1014197 & 19.15\\% & 36.98 & 31.01\\% & 507098.5 & 64.05\\%\\\\\n",
       "\t member & FALSE & 2084398 & 39.35\\% & 13.51 & 23.29\\% & 416879.6 & 51.82\\%\\\\\n",
       "\t member &  TRUE &  775203 & 14.64\\% & 16.01 & 10.26\\% & 387601.5 & 48.18\\%\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 4 × 8\n",
       "\n",
       "| member_casual &lt;chr&gt; | weekend &lt;lgl&gt; | trips &lt;int&gt; | percent of all trips &lt;chr&gt; | avg duration (minutes) &lt;chr&gt; | percent total duration &lt;chr&gt; | trips per day &lt;dbl&gt; | percent per day per rider type &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| casual | FALSE | 1422952 | 26.86% | 30.13 | 35.44% | 284590.4 | 35.95% |\n",
       "| casual |  TRUE | 1014197 | 19.15% | 36.98 | 31.01% | 507098.5 | 64.05% |\n",
       "| member | FALSE | 2084398 | 39.35% | 13.51 | 23.29% | 416879.6 | 51.82% |\n",
       "| member |  TRUE |  775203 | 14.64% | 16.01 | 10.26% | 387601.5 | 48.18% |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual weekend trips   percent of all trips avg duration (minutes)\n",
       "1 casual        FALSE   1422952 26.86%               30.13                 \n",
       "2 casual         TRUE   1014197 19.15%               36.98                 \n",
       "3 member        FALSE   2084398 39.35%               13.51                 \n",
       "4 member         TRUE    775203 14.64%               16.01                 \n",
       "  percent total duration trips per day percent per day per rider type\n",
       "1 35.44%                 284590.4      35.95%                        \n",
       "2 31.01%                 507098.5      64.05%                        \n",
       "3 23.29%                 416879.6      51.82%                        \n",
       "4 10.26%                 387601.5      48.18%                        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# weekend trips vs. weekday trips - aggregated\n",
    "# (this is probably very bad, inefficient R - but I am still learning!)\n",
    "\n",
    "divvy_trips %>% \n",
    "  mutate( 'day of week' = wday(started_at, label = TRUE)) %>% \n",
    "  mutate( weekend = case_when(\n",
    "    `day of week` %in% c('Sat', 'Sun') ~ TRUE,\n",
    "    TRUE ~ FALSE)\n",
    "  ) %>% \n",
    "  group_by( member_casual, weekend) %>%\n",
    "  summarise(\n",
    "    trips = n(),\n",
    "    'percent of all trips' = sprintf( '%0.2f%%', trips / nrow( divvy_trips) * 100),\n",
    "    'avg duration (minutes)' = sprintf( '%0.2f', mean( ride_duration_sec) / 60),\n",
    "    'percent total duration' =\n",
    "      sprintf( '%0.2f%%', sum( ride_duration_sec) /\n",
    "                 sum( divvy_trips$ride_duration_sec) * 100)\n",
    "  ) %>%\n",
    "  mutate( 'trips per day' = case_when(\n",
    "    weekend ~ trips / 2,\n",
    "    TRUE ~ trips / 5)\n",
    "  ) %>% \n",
    "  # mutate( trip_sum = sum(`trips per day`)) %>% \n",
    "  mutate( 'percent per day per rider type' = sprintf(\n",
    "    '%0.2f%%', `trips per day` / sum(`trips per day`)  * 100))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4aa9abea",
   "metadata": {
    "papermill": {
     "duration": 0.200993,
     "end_time": "2022-01-26T03:28:05.901489",
     "exception": false,
     "start_time": "2022-01-26T03:28:05.700496",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The above tells us that \"casual\" riders take more trips *per day* (78% more) on the weekend (Saturdays and Sundays), and fewer - during the weekdays, with an uptick on Fridays. However \"member\" (annual pass) usage does not fall off on the weekends (per day) - i.e. their trips aren't just about commuting to/from work, apparently. In other words, this visualizations tells us:\n",
    "\n",
    "**Casual riders take more trips per day on the weekends** compared to weekdays.\n",
    "\n",
    "Perhaps we could recommend to Divvy Bikes that they explore special \"weekends only\" annual passes that could be attractive enough to casual weekend riders to invest in them. We'd then need to analyze metrics such average annual spending of casual riders - perhaps something we could put forward as a recommendation."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "322931e3",
   "metadata": {
    "papermill": {
     "duration": 0.199919,
     "end_time": "2022-01-26T03:28:06.303723",
     "exception": false,
     "start_time": "2022-01-26T03:28:06.103804",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* Next: visualization for **average duration** by rider type / day of week"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "9b375195",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:28:06.717737Z",
     "iopub.status.busy": "2022-01-26T03:28:06.715655Z",
     "iopub.status.idle": "2022-01-26T03:28:14.663855Z",
     "shell.execute_reply": "2022-01-26T03:28:14.662559Z"
    },
    "papermill": {
     "duration": 8.155659,
     "end_time": "2022-01-26T03:28:14.664023",
     "exception": false,
     "start_time": "2022-01-26T03:28:06.508364",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\n+dT7cx/RmXZq0c7z7We8dne9cBGpUbvBP7/0/HLhX91mNJ25fF+13q/1uK2aiFR/RenR95UP\nT/frEx3s1bIAAIBrUkLCVZ8wUkAhISE+mnLxpDXYHfv0oe7Tlle45dHXJgxu06h6kJJ2+M+t\ni6c/9b9p3S2Njy29r3Iu4zpTj1eqUuXOqiUuNyhNQq3bLiWmxW06mep8vGPG0/+sYW2a2Gbv\n3HC2z0PVvF4eAABwLbJMn1jo00yf9EKhT7OY0xrsXhv5lS263/51bwUZMu6HveGW+5u17+yq\nVOaTJ16X++blMq4ltO3s2W09b+2J+985k1ipf630pE9FpG6Q2fNRnSDTmj/i5KGMtytXrtyz\nZ4/7dWBg4OOPP651sfxEURSbTdO56euByWSiNzwsFovRaPR3FcVFYGAgPzDtxk4jM3YamVmt\nVpOp+F50npSU5O8SkDOtG82yc8k1J43wpDo3xRA0Ynit9579WCS3YJfZiV9XzZ3zjr1q54md\nyjtOJIlIpOm/a+qizEZHYqrn7Y4dO9asWeN+HR4ePmrUKC2zSNNYim8EBBSvXwv2Y28YDIZi\n1Rv+3TDMZrPZbM57uKLi396wWq1+nX9WfuwNRVGK1Z+J+LU3jEZjsfr/DzuNXBDsii2twc5m\nMKT+m5q9PfXfVMWo6T9Y6RcPvDNv7urfYtt3f/yFB28NUJQES6CIXHS4bJf/ki/YncYwi2eU\natWqNW/e3P06ODjYbrdrrNaProkii4bL5XI6nf6uorhwOp0ul8vfVRQXDoeDI3Ye7DQ82Glk\nxk4D3tEa7EbWCB3//tBfp2+7Ify//2qnx+0a/r+DodVfynP0hBPrR4+Zb2zQ+ZW3+taKyvjv\nqTm4gcimAymOCtaMYHcoxRHaJswzVv/+/fv37+9+7XK5YmNjtZTqx4skVVWNi4vz3/xz4Mfe\ncDgc8fHx/pt/Vv69ejY1NTUlJcWvJVzBv72RmJjocBSj37DxY2+4XC52Gh52u913V9B7wb9/\nJikpKampORxPAXKnNdj1/2zq5HpPtK7caMDw/q0bVg+QlCN/bl0y/52DyZa5n/bPfVzVlfzC\n0wutHZ6cO+SWzKdyA8JuKWdZ9N1PMbd1qSAi9qTdvySk33dbGS8XBQAA4PqmNdiF1Rq6d63p\n4aETFs0Yv+hyY0StdgsWLB1SOyy3MUWSYz7cm2zv3yBo56+//jfjwOqN64WN6V577JIp68qO\n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\nEXZ49pAGGn3JXyOTov6eIoToOf3rw2F/Htm9qUcV70K1Mn7SS5bl7R1KWeaq9ORb3Sp66byq\njpuz7NddezavX/Z6s1IqtcvHv4Vn6IO52/btY9ob5TzdS7des3Vv2MHt4zpW1OiK7YlOkq0H\nu2wrsR3sjGmx7Yq6+NXts3nX0RMHtvau5uNZZoBs6/hJe7OKd6E6r2/de3z/1tUtgmoIIYZd\niLJRuSzLv75colzPfabbYTPHj373k8w78uTH82M8xdaOc2vBzsZu5naw29Ci2JJb/11Gemxq\nI42++LKth//5fc/Q5wp5lOmTZt9joy4MF0J8vO77LRZ+3Xs7222aWHTb1jOe7T5mOZdlnWlJ\nV2q5aUu8PHzrnsPHD+yY1qe2ysl73a34J9xHa/VYOyyRfxDsoHybg/97l0SSNN5Fgl4dOP18\n3H8Xmm2bNbhcoK/evUjd5t1/Phfd/7liGifX47EpZz/t42Nwci/e08Y6Nr7uxPaklsEu5tL7\nQogak8MybMTauOmbq+rM+tPaLme4eEKlda74vy5bz0VbTp3he+zCj02XJOnd/bdkWU5PufPB\nm+2Ke7tqXXyqNey05rcHYevnOUOrlfJzUmt8i5Zq1WPMmdiUzFPf+a2n5ZeVyLKcnnxj/phe\n1UoV1mvULp6F67/Y89sj/71ymPtg2W179jEl9sw7rzUv4uGs0btWff6/r5CwFuyyrcR2sJNl\nOSni6NCOzUoXcXcrVKxJt7EnH15IYe3YSEv8973OTf3d9UXKNfj2z3Pm48Ra5bIsv+ZnGPDH\ng26vqeCjc2+QeS+eyvGc06fY2nFuPdhZ3c1cDXbGtNiK/i8/stiY8uXY10r6ujk5e9R95c3j\nUcl2Pvbi2iaZ3+PyrbQp222aWHbbxjOe/T5mmivzPkaf/6lbi1pernoXn4A6TTuvOHzb2jZz\nsI9W6rF2WCL/kGT5KXxSFUBeir32iUeJ0Xui4s2f5RT1OqcAAAFOSURBVM8/5LTIKp5FF1yP\naeape5Lt5Od9tEda4rkvlu1s339QgFYlhIi/+YVb4KDj95Nrulr9GF9S5I+eJabcjT7hZsfn\nJgEgS1w8ARQockpyWsLSvh97V5qaPxOPpPFePqzymE/suugva/l+H+2hcvL7+r23Q6asvn43\n+s6/J98LmeIbPNFGqhNCnJw1sfo7X5HqADwJgh1QkCSEr9Q7uYw5YJy5YbCja7Gq1tStPkt6\nXU6y67q/zArEPmZLpfHecXR10QMfVy9VOCj4pb+Kdtu1b4KN9dMSzvZeGfDTuOp5ViEAReKt\nWKBAkVPOhZ3Ulwkumb9PZd3/5/DlIrWru9k6QWVVAdnHpyslOuxERNn6QW6OLgRAwUawAwAA\nUAjeigUAAFAIgh0AAIBCEOwAAAAUgmAHAACgEAQ7AAAAhSDYAQAAKATBDgAAQCH+D9xUrO5E\nrEtwAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# visualize average duration by rider type by day of week\n",
    "\n",
    "divvy_trips %>% \n",
    "  # head(100000) %>%\n",
    "  within( weekday <- wday(started_at, label = TRUE)) %>%\n",
    "  group_by( member_casual, weekday) %>% \n",
    "\n",
    "  summarise( number_of_rides = n(),\n",
    "             avg_duration = mean(ride_duration_sec) / 60) %>% \n",
    "  arrange( member_casual, weekday)  %>% \n",
    "\n",
    "  ggplot( aes( x = weekday, y = avg_duration, fill = member_casual)) +\n",
    "  labs( x = \"day of the week\",\n",
    "        y = \"average duration (minutes)\",\n",
    "        fill = \"rider type\") +\n",
    "  labs( title   = \"Average duration by rider type by day of the week\",\n",
    "        caption = sprintf( \n",
    "          \"Data: Divvy Bikes (City of Chicago). Dates: from %s to %s.\",\n",
    "          format( min( divvy_trips$started_at), \"%D\"),\n",
    "          format( max( divvy_trips$started_at), \"%D\")\n",
    "          )\n",
    "        ) +\n",
    "\n",
    "    geom_col( position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c4906db0",
   "metadata": {
    "papermill": {
     "duration": 0.214796,
     "end_time": "2022-01-26T03:28:15.083131",
     "exception": false,
     "start_time": "2022-01-26T03:28:14.868335",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "* average duration by rider type for weekends and weekdays"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "5b52c499",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-01-26T03:28:15.505358Z",
     "iopub.status.busy": "2022-01-26T03:28:15.503068Z",
     "iopub.status.idle": "2022-01-26T03:28:22.450188Z",
     "shell.execute_reply": "2022-01-26T03:28:22.449079Z"
    },
    "papermill": {
     "duration": 7.16034,
     "end_time": "2022-01-26T03:28:22.450405",
     "exception": false,
     "start_time": "2022-01-26T03:28:15.290065",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "`summarise()` has grouped output by 'member_casual'. You can override using the `.groups` argument.\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 4 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>weekend</th><th scope=col>trips</th><th scope=col>avg duration minutes</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;lgl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>FALSE</td><td>1422952</td><td>30.12701</td></tr>\n",
       "\t<tr><td>casual</td><td> TRUE</td><td>1014197</td><td>36.98235</td></tr>\n",
       "\t<tr><td>member</td><td>FALSE</td><td>2084398</td><td>13.51166</td></tr>\n",
       "\t<tr><td>member</td><td> TRUE</td><td> 775203</td><td>16.00820</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 4 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & weekend & trips & avg duration minutes\\\\\n",
       " <chr> & <lgl> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & FALSE & 1422952 & 30.12701\\\\\n",
       "\t casual &  TRUE & 1014197 & 36.98235\\\\\n",
       "\t member & FALSE & 2084398 & 13.51166\\\\\n",
       "\t member &  TRUE &  775203 & 16.00820\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 4 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | weekend &lt;lgl&gt; | trips &lt;int&gt; | avg duration minutes &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | FALSE | 1422952 | 30.12701 |\n",
       "| casual |  TRUE | 1014197 | 36.98235 |\n",
       "| member | FALSE | 2084398 | 13.51166 |\n",
       "| member |  TRUE |  775203 | 16.00820 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual weekend trips   avg duration minutes\n",
       "1 casual        FALSE   1422952 30.12701            \n",
       "2 casual         TRUE   1014197 36.98235            \n",
       "3 member        FALSE   2084398 13.51166            \n",
       "4 member         TRUE    775203 16.00820            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "divvy_trips %>% \n",
    "  # head(100000) %>%\n",
    "  mutate( 'day of week' = wday(started_at, label = TRUE)) %>% \n",
    "  mutate( weekend = case_when(\n",
    "    `day of week` %in% c('Sat', 'Sun') ~ TRUE,\n",
    "    TRUE ~ FALSE)\n",
    "  ) %>% \n",
    "\n",
    "  group_by( member_casual, weekend) %>% \n",
    "\n",
    "  summarise( trips = n(),\n",
    "             'avg duration minutes' = mean(ride_duration_sec) / 60)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "da50da33",
   "metadata": {
    "papermill": {
     "duration": 0.228795,
     "end_time": "2022-01-26T03:28:22.916222",
     "exception": false,
     "start_time": "2022-01-26T03:28:22.687427",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Average duration goes up 23% for casual riders on the weekends (30 to 37 minutes), and 18% (from 13.5 to 16 minutes) for members.\n",
    "\n",
    "The key takeaway:\n",
    "\n",
    "**Casual riders take longer trips** - over twice as long on average.\n",
    "\n",
    "In other words, there may be a point to promote special weekend-only annual passes to casual weekend riders by offering longer rides compared to standard members."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4745e185",
   "metadata": {
    "papermill": {
     "duration": 0.20813,
     "end_time": "2022-01-26T03:28:23.340302",
     "exception": false,
     "start_time": "2022-01-26T03:28:23.132172",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Step 4: Summary, Conclusions, Recommendations\n",
    "\n",
    "To answer the key question we've been tasked to answer:\n",
    "\n",
    "> How do annual members and casual riders use Cyclistic bikes differently?\n",
    "\n",
    "* **Casual riders take more trips on the weekends** (Saturdays and Sunday) - about 50% more, compared to weekdays. There's also a marked increase in the number of trips on Fridays for casual riders - about 20% higher vs. other weekdays.\n",
    "* **Casual riders take longer trips** - about 30 minutes on average compared to 15 minutes for \"members\".\n",
    "* They (casual riders) don't take significantly longer trips on the weekends - i.e. the duration of their rides doesn't change from weekdays to weekends.\n",
    "\n",
    "#### Conclusions\n",
    "\n",
    "* Casual riders take significantly more trips on the weekends (Saturdays and Sundays), and also on Fridays. They also generally take longer rides compared to members - about twice as long.\n",
    "* Members' (annual pass holders) do not vary as significantly in the number of trips taken on the weekends vs. weekdays.\n",
    "* Further analysis is needed to determine the exact recommendations as well as address potential data quality issues.\n",
    "\n",
    "#### Recommendations\n",
    "\n",
    "* Given that casual riders generally take longer rides, and take significantly more rides (trips) between Friday and Sunday, explore offering special **weekends-only annual passes** targeting casual riders that would allow them to take unlimited trips during the weekend for a flat annual fee, similar to annual pass holders, but with a longer duration limit vs. \"members\".\n",
    "    + Side note: Divvy Bikes does offer *day passes* that somewhat address the above recommendation. Yet we can't analyse day pass usage separately as there are't \"day pass\" rides in the dataset - possibly because day pass holders are bundled together with single-trip riders into the \"casual\" category.\n",
    "* Explore **pricing (profitability and ROI) analysis** for higher quality recommendations. E.g. if we could determine that some casual riders spends more than members during certain months or per year, we could potentially entice them with annual passes tailored to their usage pattern. (This would require to track individual riders while anonymizing their data to gauge their pattern of usage throughout the year - something this dataset doesn't offer. I.e. there's no way currently to determine usage patterns or average spending per rider (causal or member) per year or per month - as there are no rider IDs allowing to attribute trips to a specific rider.)\n",
    "* Discuss data quality issues documented above with dataset owners to ensure the data is reliable.\n",
    "* Ask what the `docked_bike` means for `rideable_type` - which accounts for about 8% of total trips."
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 179.517801,
   "end_time": "2022-01-26T03:28:23.763018",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-01-26T03:25:24.245217",
   "version": "2.3.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
