#!/usr/bin/env bash
#
# Copyright 2024 PKU-Alignment Team. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================
# export CUDA_VISIBLE_DEVICES=0
export HF_ENDPOINT="https://hf-mirror.com"


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${SCRIPT_DIR}/../align_anything/evaluation" || exit 1

BENCHMARKS=("mt_bench")
OUTPUT_DIR=/data/wmz_workspace/align-anything/eval_results
GENERATION_BACKEND=deepspeed
MODEL_ID=gemma_alpaca_sft_ds
MODEL_NAME_OR_PATH=/data/wmz_workspace/checkpoints/gemma-2b_alpaca_sft
CHAT_TEMPLATE=Gemma

for BENCHMARK in "${BENCHMARKS[@]}"; do
    python __main__.py \
        --benchmark ${BENCHMARK} \
        --output_dir "${OUTPUT_DIR}/${BENCHMARK}/${MODEL_ID}" \
        --generation_backend ${GENERATION_BACKEND} \
        --model_id ${MODEL_ID} \
        --model_name_or_path ${MODEL_NAME_OR_PATH} \
        --chat_template ${CHAT_TEMPLATE}
done