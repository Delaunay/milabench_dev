
CONDA_ACTIVATE=. $$(/home/delaunap/miniconda3/bin/conda info --base)/etc/profile.d/conda.sh ; conda activate

# /home/delaunap/miniconda3/etc/profile.d/conda.sh


setup:
	($(CONDA_ACTIVATE) py312; )

front:
	cd dashboard/dashboard/ui && npm run dev

back:
	($(CONDA_ACTIVATE) py312; POSTGRES_USER=milabench_write POSTGRES_PSWD=1234 flask --app dashboard.server.view:main run --host=0.0.0.0 --debug)

pytests:
	($(CONDA_ACTIVATE) py312; POSTGRES_USER=milabench_write POSTGRES_PSWD=1234 pytest milabench/tests/integration/server/test_db_queries.py -s -k test_sql_direct_report_vs_pandas)


push-docker:
	# pass