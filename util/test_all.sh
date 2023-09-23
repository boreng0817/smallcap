#!/bin/bash

li=("checkpoint-13284" "checkpoint-17712" "checkpoint-22140" "checkpoint-26568" "checkpoint-30996" "checkpoint-35424" "checkpoint-39852" "checkpoint-4428" "checkpoint-44280" "checkpoint-8856")
for l in ${li[@]}; do
	python coco-caption/run_eval.py coco-caption/annotations/captions_testKarpathy.json experiments/rag_7M_gpt2/$l/test_preds.json &
done
