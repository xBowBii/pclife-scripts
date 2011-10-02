/*====================================================================================== 
							 ARMA2 Custom Shader by EOOQE 
							 A2FXAA.BLOGSPOT.COM

							 V0.22b 
							 ARMA2 Takistan Special V0.1

							 THX to : forum-3dcenter.org and Violator
======================================================================================*/



/*------------------------------------------------------------------------------
						FILTER SELECTION
------------------------------------------------------------------------------*/
// Comment to deactivate an effect. 
// Example: To disable the tonemap effect, use // in front of #define USE_TONEMAP
#define FXAA_QUALITY__PRESET 9
#define USE_ANTI_ALIASING
#define USE_PRE_SHARPEN
#define USE_BLOOM
//#define USE_TECHNICOLOR
//#define USE_TONEMAP
#define USE_SEPIA
//#define USE_VIGNETTE
//#define USE_POST_SHARPEN
//#define USE_FINAL_LIMITER
/*------------------------------------------------------------------------------
						FXAA SHADER
------------------------------------------------------------------------------*/
float fxaaQualitySubpix = 8; // old 9
float fxaaQualityEdgeThreshold = 3;
float fxaaQualityEdgeThresholdMin = 3; // old 2
/*------------------------------------------------------------------------------
						PRE_SHARPEN
------------------------------------------------------------------------------*/
bool highQualitySharpen = 1;
// Set values to calculate the amount of  AA produced blur to consider for the sharpening pass
#define Average 0.8
#define CoefBlur 2
// Set values of the sharpening amount
#define SharpenEdge 0.2
#define Sharpen_val0 1.2
/*------------------------------------------------------------------------------
						BLOOM
------------------------------------------------------------------------------*/
// Number of samples per pixel taken for the Bloom effect. Don't set it to high!  4 = 25spp, 8 = 81spp, 16 = 289spp
#define NUM_SAMPLES2 4 // Must be set with a value dividable by 2
float BloomPreset = 3; // Disabled = 0 (Valid Preset Values = 1 to 9) Preset value 1 to 9 takes control over the next 3 settings.
float BloomThreshold = 1; // The min. level at which the effect starts (Valid Values = 1 to 9, use decimals for finetuning)
float BloomWidth = 1; // Sets the width of the effect (Valid Values = 1 to 9, use decimals for finetuning)
float BloomPower = 1; // The power of the effect (Valid Values = 1 to 9, use decimals for finetuning)
/*------------------------------------------------------------------------------
						TECHNICOLOR
------------------------------------------------------------------------------*/
#define TechniAmount 0.20 // 1.00 = Max
#define TechniPower 4.0 // lower values = whitening
// lower values = stronger channel
#define redNegativeAmount 1.0 // 1.00 = Max
#define greenNegativeAmount 1.0 // 1.00 = Max
#define blueNegativeAmount 1.0 // 1.00 = Max
/*------------------------------------------------------------------------------
						TONEMAP
------------------------------------------------------------------------------*/
#define Gamma 1.10
#define Exposure 0.00
#define Saturation 0.05 // use negative values for less saturation. 
#define BlueShift 0.00 // Higher = more blue in image.
#define Bleach 0.05 // Bleach bypass, higher = stronger effect
#define Defog 0.055 // Strength of Lens Colors.
#define FogColor float4(0.08, 0.28, 0.10, 3.0) //Lens-style color filters for Blue, Red, Yellow, White.
/*------------------------------------------------------------------------------
						SEPIA
------------------------------------------------------------------------------*/
#define Tan // Color Tone, available tones can be seen in ColorTones.PNG (Do not use spaces in the name!)
#define GreyPower 1 //(Valid Values = 1 to 9, use decimals for finetuning), defines how much of the grey color you wish to blend in 
#define SepiaPower 1 //(Valid Values = 1 to 9, use decimals for finetuning), defines how much of the color tone you wish to blend in
/*------------------------------------------------------------------------------
						VIGNETTE
------------------------------------------------------------------------------*/
// Vignette effect, process by which there is loss in clarity towards the corners and sides of the image, like a picture frame
#define VignetteCenter float2(0.500, 0.500) // Center of screen for effect.
#define VignetteRadius 1.00 // lower values = stronger radial effect from center
#define VignetteAmount -0.70 // Strength of black. -2.00 = Max Black, 1.00 = Max White.
/*------------------------------------------------------------------------------
						POST_SHARPEN
------------------------------------------------------------------------------*/
// Controls additional sharpening applied after previous processing. Strength should be max 0.25!
float Sharpen = 0.07;
/*------------------------------------------------------------------------------
						FINAL_LIMITER
------------------------------------------------------------------------------*/
// Controls the strenght of the limiter. 1.000 for default setting
int LimiterStrenght = 1.000; 