# cycic-transformers

This repository demonstrates how to train and test on the CycIC dataset using the popular transformers library from huggingface. The original example scripts can be found at [transformers/examples/multiple-choice/](https://github.com/huggingface/transformers/tree/master/examples/multiple-choice). Here, they have been extended with an additional data processing class for the CycIC task.

To train a transformers model on CycIC, first download the CycIC dataset and install transformers, then run the following:
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
--output_dir models_bert/cycic_base \
--per_gpu_eval_batch_size=16 \
--per_gpu_train_batch_size=16 \
--gradient_accumulation_steps 2 \
--overwrite_output
```
