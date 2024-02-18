# This X-Ray Does Not Exist
![image](https://github.com/jayanthspratap/this-xray-does-not-exist/assets/33165884/f9508827-787b-468e-84fd-9191aaa097d5)

*A generative AI pipeline for synthesis of realistic medical images. Tested by expert radiologists. Industry applications for data enrichment of AI models, and overcoming clinical data-sharing barriers.*

## 💭 Motivation
Medical images play a crucial role in training artificial intelligence (AI) algorithms for various diagnostic tasks. However, limited access to large-scale datasets poses a challenge in developing accurate and robust models. Recent advances in latent diffusion models have demonstrated the generation of novel, realistic images using text prompts. Generating high-fidelity medical images could potentially solve the medical data gap. We present an approach for generating synthetic chest X-rays (CXRs) with domain adaptation of Stable Diffusion (SD), a state-of-the-art latent diffusion model for text-to-image generation. We also present a method for removal of text and artifacts from the resulting synthetic images, and evaluated images with two expert radiologists.

## 🔨 Methods
To generate novel CXRs, we fine-tuned the SD v2-1-base model for 10 epochs on an Intel® Max Series GPU, using low-rank adaptation. We used a dataset of 32,532 CXRs paired with clinical reports, a proprietary dataset obtained in a research partnership with Segmed. We then performed GPU inference and generated 1,000 synthetic CXRs using classifier-free guidance of 4, and 75 inference steps.

We implemented a text removal step on images, to eliminate textual artifacts on the generated images. This pipeline leverages text segmentation using Meta’s Segment Anything Model, and inpainting with Stability.AI’s Stable Diffusion 2. The inference is run on an Intel® Max Series GPU and can be executed through a Gradio web application.

## 📈 Evaluation and Results
1. The synthetic images showed quantitative concordance with real CXRs. The Fréchet Inception Distance between the synthetic and real dataset was 68.4, calculated using InceptionV3 pretrained on ImageNet.
2. A random sample of 50 generated CXRs and 50 real CXRs was shuffled, given to a board-certified radiologist with >10 years of clinical experience, and labeled as either "synthetic" or "real". The reader had an accuracy of 0.81, sensitivity 0.86, and specificity 0.76. **Notably, Reader 1 misidentified 7 out of 50 synthetic images as real images.**

3. A random sample of 100 generated CXRs was examined for overall quality (anatomy, style, artifacts) by the same radiologist expert. Some feedback, both positive and negative, is included below in reference to the synthetic X-rays:

> A few [synthetic images] stand out due to their sharpness and defined details, making them more closely resemble real X-rays.

> The rib cage and heart have a "box-y" shape. However, the lung parenchyma looks good.

> Looks good, except for the ECG marker with a weird position (also the only one).

> Costo-phrenic angles too deep, esp on the left.

**In total, there were 36 positively scoring samples that were deemed by the radiologist to be comparable to real X-rays, in both anatomy and appearance.** Of the remainder, many were labeled as moderate quality, with the only identified downside being the presence of text artifacts. In the majority of these cases, the AI-enabled text removal is able to rectify this, creating a clean synthetic CXR.

## 🏆 Conclusion
Our pipeline is able to generate synthetic CXRs that resemble real CXRs, with further improvement in performance to be expected as we scale up the training time and data. The proposed method holds promise for augmenting limited medical image datasets, facilitating the development of robust ML algorithms in chest radiography. The ability to generate realistic synthetic CXRs has significant implications for the field of medical imaging. By augmenting limited datasets, our approach can improve training ML algorithms for diagnostic tasks, holding tremendous potential for advancing healthcare outcomes.

## Footnotes
This project was completed in the 2024 TreeHacks hackathon at Stanford University. Computation was done on the Intel Developer Cloud platform. Data acquisition was done in partnership with Segmed, and no patient data is made available in this repository. Hence, all scripts and notebooks are included for transparency as opposed to direct replicability. Please contact jaypratap@college.harvard.edu with any questions.
