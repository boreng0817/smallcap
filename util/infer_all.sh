#!/bin/bash
li=("checkpoint-13284" "checkpoint-17712" "checkpoint-22140" "checkpoint-26568" "checkpoint-30996" "checkpoint-35424" "checkpoint-39852" "checkpoint-4428" "checkpoint-44280")
last="checkpoint-8856"
log_file="nohup_out"

mkdir $log_file

for l in ${li[@]}; do
	nohup python infer.py --model_path experiments/rag_7M_gpt2 --checkpoint_path $l --infer_test > $log_file/$l 2>&1 &
done

python infer.py --model_path experiments/rag_7M_gpt2 --checkpoint_path $last --infer_test

rm -rf $log_file
