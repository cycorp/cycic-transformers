# cycic-transformers

This repository demonstrates how to train and test on the CycIC dataset using the popular transformers library from huggingface. The original example scripts can be found at [transformers/examples/multiple-choice/](https://github.com/huggingface/transformers/tree/master/examples/multiple-choice). Here, they have been extended with an additional data processing class for the CycIC task.

## Train on CycIC:
To train a transformers model on CycIC, first download the CycIC dataset and install transformers. You can train the model using the run_multiple_choice script, like so:
```
export CYCIC_DIR=/path/to/cycic_data
python ./multiple-choice/run_multiple_choice.py \
--task_name cycic \
--model_name_or_path roberta-base \
--do_train \
--do_eval \
--data_dir $CYCIC_DIR \
--learning_rate 5e-5 \
--num_train_epochs 3 \
--max_seq_length 80 \
--output_dir roberta-model \
--per_gpu_eval_batch_size=16 \
--per_gpu_train_batch_size=16 \
--gradient_accumulation_steps 2 \
--overwrite_output
```

## Submit to the AI2 leaderboard:
The script run_model.sh gives an example of how to run this model as a submission for the AI2 leaderboard. Notice that it uses the cycic-leaderboard data processor, which does not attempt to load labels for the data.

## Evaluate results:
After generating a predictions file, you can use the eval.py script to compute accuracy broken down by different question categories. For example,
```
python eval.py --preds_file predictions.lst --answers_file data/CycIC_dev_labels.jsonl --questions_file data/CycIC_dev_questions.jsonl
Total                      0.26 (409/1564)
object properties          0.28 (65/231)
logical reasoning          0.35 (126/361)
true/false/unknown         0.32 (9/28)
composition                0.18 (4/22)
true/false                 0.32 (189/588)
arithmetic                 0.21 (17/81)
quotation                  0.24 (9/38)
multiple choice            0.22 (211/948)
temporal sequences         0.22 (44/198)
events                     0.25 (18/71)
conceptual                 0.38 (21/55)
theory of mind             0.23 (77/341)
disjointness               0.32 (27/85)
classification             0.22 (34/152)
temporal reasoning         0.22 (38/171)
culture                    0.28 (19/67)
capabilities               0.10 (1/10)
causal reasoning           0.41 (23/56)
nature                     0.40 (6/15)
animals                    0.12 (1/8)
counterfactual             0.00 (0/5)
social relations           0.06 (1/16)
norms                      0.24 (10/41)
```