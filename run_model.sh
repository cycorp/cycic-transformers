#!/bin/bash
python ./multiple-choice/run_multiple_choice.py \
       --task_name cycic-leaderboard \
       --model_name_or_path ./roberta-model \
       --do_predict \
       --data_dir /data/ \
       --gradient_accumulation_steps 2 \
       --overwrite_output \
       --output_dir /results \
       --cache_dir /results \
       --predictions_file predictions.lst
