export MODEL_NAME="stabilityai/stable-diffusion-2-1-base"
export DATA_DIR="../datasets/segmed_filtered_images"
export OUT_DIR="../models/sd-cxr-healthy-2024_02_17"

accelerate launch --mixed_precision="fp16" train_text_to_image_lora.py \
  --pretrained_model_name_or_path=$MODEL_NAME \
  --train_data_dir=$DATA_DIR \
  --caption_column="text" \
  --resolution=512 \
  --train_batch_size=5 \
  --num_train_epochs=10 --checkpointing_steps=1000 \
  --learning_rate=1e-04 --lr_scheduler="constant" --lr_warmup_steps=0 \
  --seed=42 \
  --output_dir=$OUT_DIR \
  --validation_prompt="cxr healthy" --report_to="wandb" >> ../output/output_2024_02_17.txt 2>&1