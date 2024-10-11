export HF_ENDPOINT="https://hf-mirror.com"

PRETRAINED_MODEL=/data/wmz_workspace/MDSPO/output/4-spoch-gemma-alpaca/sp_4
REVISION=sp_4
OUTPUT_PATH=/data/wmz_workspace/align-anything/eval_results/openllm/${PRETRAINED_MODEL}/${REVISION}
lm-eval --model_args="pretrained=${PRETRAINED_MODEL},revision=${REVISION}" --tasks=leaderboard  --batch_size=auto --output_path=${OUTPUT_PATH}