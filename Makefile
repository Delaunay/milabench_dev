
CONDA_ACTIVATE=. $$(/home/delaunap/miniconda3/bin/conda info --base)/etc/profile.d/conda.sh ; conda activate

# /home/delaunap/miniconda3/etc/profile.d/conda.sh


setup:
	($(CONDA_ACTIVATE) py310; )

front:
	cd milabench_dash && npm run dev

back:
	($(CONDA_ACTIVATE) py310; POSTGRES_USER=milabench_write POSTGRES_PSWD=1234 flask --app milabench.web.view:main run --debug)

pytests:
	($(CONDA_ACTIVATE) py310; POSTGRES_USER=milabench_write POSTGRES_PSWD=1234 pytest milabench/tests/integration/server/test_db_queries.py -s -k test_sql_direct_report_vs_pandas)

