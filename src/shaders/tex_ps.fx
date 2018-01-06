cbuffer ConstBuf: register(b0)
{
	float4 Color;
};

Texture2D Img: register(t0);
SamplerState Sampler: register(s0);

struct PS_INPUT
{
	float4 Pos: SV_POSITION;
	float2 Tex: TEXCOORD;
};

float4 main(PS_INPUT input): SV_TARGET
{
	float4 output = Img.Sample(Sampler, input.Tex) * Color;
	if (output.a <= 0.04f)
		discard;
	return output;
}
