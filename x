GOOGLE OMNI 1.1 FLASH — OFFICIAL VIDEO PROMPTING KNOWLEDGE BASE
1. Model Verification and Technical Overview
An exhaustive audit of official Google Developer, Google DeepMind, and Google Cloud technical documentation establishes the precise architectural identity, endpoint configuration, and deployment scope of Google's flagship multimodal video model1.



Python
# Official API Model Identifier
MODEL_ID = "gemini-omni-1.1-flash"
PRIMARY_API = "Interactions API"
GA_RELEASE_DATE = "August 27, 2026"
PREVIEW_DEPRECATION_DATE = "September 30, 2026"

The exact official model name established by Google is Gemini Omni 1.1 Flash, which is also referred to interchangeably in official documentation as Gemini Omni Flash1. In developer API requests, the model identifier is strictly gemini-omni-1.1-flash2. The early developer preview endpoint, gemini-omni-flash-preview, was officially scheduled for deprecation on September 30, 2026, following the General Availability (GA) launch of version 1.1 on August 27, 20263. Any discrepancy between developer terminology such as "Omni Flash" and "Omni 1.1 Flash" reflects the transition from preview to GA status; the production-ready model is gemini-omni-1.1-flash1.
Enterprise and Developer Interface Distribution
Gemini Omni 1.1 Flash is exposed across four distinct Google product environments and APIs, each tailored to specific developer and creator workflows1:
    • Google AI Studio (Gemini API): Direct access for developers utilizing the Software Development Kits (Python, JavaScript, Java) or raw REST endpoints via the Interactions API (client.interactions.create)1.
    • Gemini Enterprise Agent Platform: Enterprise deployment infrastructure supporting high-volume agentic workflows via the Agent Platform API1.
    • Google Flow: Integrated directly into Google Flow, providing generative controls for creative production suites1.
    • Gemini Consumer Application: Native integration within the Gemini application interface, available globally to Google AI Plus, Pro, and Ultra subscribers for conversational video creation and editing1.
Core Architectural Pillars
Gemini Omni 1.1 Flash differs fundamentally from standalone text-to-video diffusion pipelines due to its native multimodal foundation, which synthesizes visual, spatial, and acoustic reasoning within a single unified model architecture2.



Text Prompt + Reference Images + Video Clips + Audio Signals
                            │
                            ▼
          Unified Gemini Omni 1.1 Flash Core
                            │
                            ▼
          Native MP4 Output (Visuals + Audio)

Native multimodality enables the simultaneous processing of text, static imagery, audio, and video inputs, ensuring that output video tracks and generated native audio stems remain temporally synchronized without relying on secondary alignment models2. Stateful conversational editing is driven natively by the Interactions API, allowing creators to iteratively modify existing generations through natural language commands while maintaining background visual elements2. Furthermore, deep integration of physical world knowledge bridges photorealism with logical visual mechanics, ensuring that complex physical interactions—such as fluid dynamics, shadow propagation, and momentum—behave predictably across sequential frames2.
2. Absolute Model Scope and Evidence Classification System
This reference document isolates technical data strictly applicable to gemini-omni-1.1-flash1. Technical specifications, parameter schemas, or prompting methodologies originating from other Google generative media models—including Veo, Veo 2, Veo 3, Veo 3.1, Imagen 4, or standalone Gemini text models—are excluded unless an official Google source explicitly confirms their direct applicability to Gemini Omni 1.1 Flash1.
To guarantee absolute verification rigor for downstream automated prompt generation, every technical claim, prompting recommendation, and parameter limit within this report is classified under a strict tripartite evidence rating:
    • Level A — OFFICIALLY DOCUMENTED: The capability, parameter, syntax rule, or limitation is explicitly stated, specified, or demonstrated by Google documentation specifically for Gemini Omni 1.1 Flash1.
    • Level B — OFFICIAL INFERENCE: The technical conclusion is logically derived from official Google developer documentation, SDK schemas, or release notes, but lacks verbatim confirmation for a specific edge-case scenario3.
    • Level C — NOT OFFICIALLY DOCUMENTED: There is insufficient official Google evidence to verify a capability, parameter, or prompting rule. In all such instances, this document explicitly records: "Google does not currently provide official Omni 1.1 Flash-specific documentation confirming this."
3. Supported Core Video Generation Capabilities
Gemini Omni 1.1 Flash provides a broad suite of generative controls designed for professional media workflows1.

Feature / Capability
Supported Status
Operating Parameters & Specifications
Evidence Level
Official Source
Text-to-Video
Supported
Generates 3–10 second video clips with synchronized native audio directly from text descriptions.
Level A
2
Image-to-Video
Supported
Animates single static image inputs (PNG, JPEG, WebP, HEIC) using text prompts to guide movement dynamics.
Level A
2
First Frame Control
Supported
Accepts a starting keyframe image to anchor the initial visual frame of the generated sequence.
Level A
1
Last Frame Control
Supported
Accepts an ending keyframe image to constrain the final frame of the generated sequence.
Level A
1
Frame Interpolation
Supported
Animates continuous video transitions between a designated first frame and last frame image input (up to 2 images).
Level A
1
Scene Extension
Supported
Extends existing clips in 10-second increments up to a total cumulative length of 40 seconds, analyzing up to 10 seconds of prior visual context.
Level A
1
360p Draft Mode
Supported
Renders 360p preview drafts up to 60% faster at one-third the execution cost of 720p generations.
Level A
1
4K Resolution Output
Supported
Renders high-resolution outputs up to 1080p or 4K via internal native upscaling pipelines.
Level A
1
Aspect Ratio Control
Supported
Supports Landscape (16:9) as default and Portrait (9:16) for vertical video platforms like YouTube Shorts.
Level A
2
Multimodal Video Reference
Supported
References up to 3 seconds of sample video input to preserve visual continuity and character key features.
Level A
1
Subject Reference
Supported
Accepts isolated image inputs of individual subjects (e.g., character + item) to synthesize combined action scenes.
Level A
1
Conversational Editing
Supported
Modifies prior generated outputs conversationally via previous_interaction_id, supporting up to 3 stacked sequential edits.
Level A
1
Audio Reference Input
Not Supported
API schema rejects or ignores standalone external audio file uploads as generation context for this model.
Level A
5
4. Official Prompting Principles and Structural Syntax
Google's official technical guidelines emphasize that Gemini Omni 1.1 Flash operates with optimal visual synthesis when prompts are written with precise, direct, and detailed visual descriptions rather than brief abstract summaries2.
Universal Prompting Principles
    1. Precision and Directness: Prompts must explicitly state visual goals, scene boundaries, and character actions without conversational fluff or subjective quality fluff11.
    2. Action and Motion Specificity: Vague directives such as "make it look cinematic" or "animate the background" yield unpredictable movement2. Developers must describe exact trajectories, subject velocity, and environmental reactions2.
    3. Multimodal Asset Disambiguation: When passing reference images or video clips alongside text, the prompt must define the role of the visual asset (e.g., whether a drawing serves as a motion blueprint or a strict structural template)2.
    4. Context Window Structuring: Within long-context requests or multi-turn editing sessions, critical behavioral instructions, output constraints, and formatting rules should be positioned at the very end of the prompt sequence to maximize model attention10.
Structural Prompt Ordering
Google documentation does not enforce an inflexible, single prompt template for Gemini Omni 1.1 Flash1. However, analyzing official sample code and technical prompt guides reveals a consistent structural sequence that maximizes prompt adherence1:
Primary Subject Description  Specific Physical Action  Environmental Setting & Context  Camera Angle & Movement Path  Lighting & Palette  Style & Aesthetic Rules  Audio, Dialogue & Sound Cues
Adhering to this sequential flow ensures that the model establishes spatial framing and character features before applying motion vector changes and audio layer alignment1.
5. Camera Control and Cinematic Motion Prompting
Gemini Omni 1.1 Flash natively translates professional cinematography terminology into frame-by-frame camera movements1.
Documented Shot Sizes and Spatial Perspectives
Official Google prompt benchmarks confirm high fidelity when requesting specific shot framings1:
    • Microscopic / Extreme Macro View: Detailed close-up imagery targeting extreme surface textures or micro-structures (e.g., "A microscopic view of iridescent marine diatoms" or "Cinematic macro close-up of vibrant golden-orange Japanese maple leaves")1.
    • Low-Angle Close-Up Shot: Positioned below eye level focused closely on subject actions (e.g., "A close-up low-angle shot of a stylish drummer in a beige suit")1.
    • Drone / Aerial Tracking Shot: High-altitude wide perspectives tracking ground motion (e.g., "A drone shot of a mountain landscape at sunrise")2.
    • Mechanical Snap-Zoom: Fast direct focus shifts onto facial features (e.g., "fast mechanical snap-zoom directly into the character's wide eyes")1.
Documented Camera Movement Dynamics
Google technical samples explicitly validate dynamic, multi-axis camera maneuvers1:

Camera Trajectory
Official Google Prompt Implementation Description
Evidence Rating
Official Source
Optical Dolly-Zoom
"The camera dollies forward while simultaneously zooming out, keeping the character's frozen shocked face locked at the exact same size."
Level A
1
Mechanical Snap-Zoom
"The camera executes a fast mechanical snap-zoom directly into the character's wide eyes."
Level A
1
360-Degree Orbital Rotation
"The camera performs a smooth, high-speed 360-degree orbital rotation around the frozen character, showcasing dramatic 3D depth."
Level A
1
Whip-Pan Transition
"transitions as the camera whip-pans to the side, revealing an older saxophonist playing alongside a ballet dancer."
Level A
1
Continuous Pull-Out
"Camera slowly pulls out, forgotten dusty catacombs" or "The camera pulls back in one continuous movement as he continues his story."
Level A
1
Subject Tracking Shot
"Fish swimming, tracking shot."
Level A
1
Focal Length and Optics Constraints: Google does not currently provide official Omni 1.1 Flash-specific documentation confirming numeric lens focal length tags (such as "35mm prime" or "85mm f/1.8"). Lens mechanics must be prompted using natural optical descriptions (e.g., "Shallow depth of field, dreamy bokeh background")1.
6. Subject, Character, and Style Modeling
Creating persistent characters and distinct artistic aesthetics requires precise physical descriptions combined with multimodal conditioning assets1.
Character Appearance and Identity Continuity
Prompts must detail explicit physical attributes—including attire, age, facial structure, and wardrobe colors—rather than relying on subjective labels1.
    • Documented Example: "a stylish drummer in a beige suit" or "an older saxophonist playing alongside a ballet dancer spinning in a white outfit"1.
    • Identity Continuity across Scene Cuts: Maintaining absolute character consistency during aggressive camera pans or across scene edits presents known physical limitations5. To minimize identity drift, developers must supply multimodal conditioning assets—such as static character reference images or up to 3 seconds of reference video—alongside text instructions1.
Documented Aesthetic Domains
Official Google benchmarks demonstrate robust execution across several visual aesthetics1:
    • Photorealistic / Cinematic: Natural lighting interaction, real-world physical momentum, and authentic surface textures1.
    • Cyberpunk / Sci-Fi: Urban visual environments featuring high-contrast neon illumination, atmospheric rain reflections, and futuristic technology2.
    • Scientific / Micro-Photography: Specialized technical aesthetics rendering translucent glass-like silica shells, amber color palettes, and dark-field optics1.
    • Stylized Drawing-to-Realistic: Converting static 2D vector illustrations or pencil sketches into photorealistic footage using the drawing purely as a movement trajectory guide2.
7. Lighting, Atmosphere, and Environmental Control
Lighting setups and atmospheric variables dictate visual contrast, volumetric perception, and spatial realism in generated video frames1.
Documented Lighting Parameters
Google developer samples validate the following explicit lighting prompts1:
    • Filtered Natural Light: Soft directional sunlight penetrating translucent foliage (e.g., "Sunlight filters through the translucent foliage, creating a warm, glowing effect")1.
    • Stage & Spot Lighting: Colored directional beams targeting moving subjects (e.g., "soft purple stage lights")1.
    • Self-Illuminating Neon: High-contrast artificial light sources in low-key settings (e.g., "A futuristic city with neon lights")2.
    • Bioluminescent / Dark Field: Selective subject illumination set against dark backgrounds (e.g., "Tiny, delicate structures glow softly against a clean dark field background")1.
Environmental Dynamics and Volumetrics
Atmospheric conditions anchor temporal movement across generated scenes1:
    • Environmental Interaction: Organic movement caused by natural forces (e.g., "gently rustling and swaying in a soft, rhythmic autumn breeze")1.
    • Volumetric Dust & Particle Suspensions: Suspended particles scattering light in dusty spaces (e.g., "forgotten dusty catacombs" or "shelves and books float weightlessly in a dusty void")1.
    • Optical Bokeh & Depth Filtering: Explicit blur boundaries isolating key subjects (e.g., "Shallow depth of field, dreamy bokeh background")1.
8. Integrated Multimodal Audio and Dialogue Prompting
Gemini Omni 1.1 Flash is an end-to-end multimodal model that natively synthesizes synchronized audio tracks alongside visual generation1.
Dialogue Scripting and Formatting
Dialogue must be declared directly inside the text prompt payload using quotes and explicit speaker attributions1.
    • Dialogue Format A (Narrative Action Integration): ...we see man's back, he says "I see it too" dramatic music score1.
    • Dialogue Format B (Direct Conversational Response): The man in the blue sweater replies: 'Did your father go out on the boat too?'1.
    • Dialogue Format C (Continuous Monologue): The camera pulls back in one continuous movement as he continues his story: 'He used to say that this harbour had a soul. And that the boats were a part of us.' The music swells.1.
    • Dialogue Format D (Direct-to-Camera Address): He then stands up walks around the desk to the camera and says 'what would you choose?'1.
Music and Ambient Sound Effects (SFX)
Ambient acoustics, physical sound effects, and background musical scoring must be appended to the visual scene description using direct audio cues1:
    • Musical Cues: Prompts can dictate dynamic musical shifts (e.g., "dramatic music score" or "The music swells")1.
    • Acoustics & SFX: Ambient soundscapes are inferred natively based on spatial visual prompts (e.g., harbors, catacombs, drum halls)1.
Audio Input Limitation: External audio files (.mp3, .wav) cannot be uploaded as API context to condition Gemini Omni 1.1 Flash5. All acoustic parameters must be prompted via natural language1.
9. Multimodal Reference Inputs and Framework Constraints
Combining text descriptions with visual reference assets provides fine-grained control over frame transitions, subject consistency, and continuous extensions1.
Keyframe Interpolation Protocols
To execute keyframe transitions, developers pass up to two static images within the API payload alongside an explicit natural language transition path1.
    • Input Structure: input = [first_frame_image, last_frame_image, text_prompt]2.
    • Prompt Mandate: The text prompt must explicitly describe the continuous transitional trajectory bridging the two images1.
    • Documented Benchmark: "A close-up low-angle shot of a stylish drummer... transitions as the camera whip-pans to the side, revealing an older saxophonist... One continuous shot, no jump cuts."1.
Multi-Asset Subject Synthesis
Developers can supply separate reference images for subjects and environments to render unified action sequences1:
    • Input Structure: input = [subject_image_1, subject_image_2, background_image, text_prompt]1.
    • Role Disambiguation Rule: Text prompts must tag image assets and specify their respective spatial behaviors1.
    • Documented Benchmark: "Use the three uploaded videos of dancers and replace them with the provided characters... The dog character dog.png should do the classical dance from dance3.mp4. The octopus octo.png should do the hip hop dance from dance1.mp4, and the bear bear.png should do the breakdance from dance2.mp4."1.
Image-to-Video Trajectory Animation
When turning static graphics into realistic video, prompts must specify whether the image represents the literal subject or a directional motion path2.
    • Documented Trajectory Directive: "turn this into realistic footage, using the drawing only as a guide for movement, do not show the drawing in the final video"2.
Scene Extension Rules and Context Window Bounds
Scene extensions generate continuous footage continuing from a pre-existing clip1.
    • Context Window Depth: Analyzes up to 10 seconds of prior visual context1.
    • Extension Increments: Generates continuations in 10-second increments1.
    • Cumulative Length Cap: Extended scenes can reach a total cumulative length of 40 seconds1.
    • API Invocation: Initiated using previous_interaction_id within the Interactions API or by uploading a video file via the Files API1.
10. Negative Prompting and Content Exclusion
Negative prompting in Gemini Omni 1.1 Flash operates differently from legacy image generation models2.
Official Exclusion Directives
Google documentation confirms that negative constraints should be integrated directly into the natural language text prompt2.
    • Inline Exclusion Syntax: Developers must include explicit negative phrasing—such as "no jump cuts", "clean architecture, continuous unbroken shot", or "do not show the drawing in the final video"—directly within the primary prompt string1.
    • SDK Schema Field: Google does not currently provide official Omni 1.1 Flash-specific documentation confirming a separate negative_prompt JSON key within the API request schema. Exclusion requirements must be defined inline as positive natural language constraints2.
11. Temporal Complexity and Multi-Action Orchestration
Packing conflicting visual actions or excessive physical events into a single short 10-second generation can cause visual tearing, physics breakdown, or unrendered commands2.
Managing Complex Sequences
    1. Single Continuous Movement Paths: Structure prompts around one core visual movement or singular dramatic event1.
    2. Conversational Edit Stacking: For multi-step modifications, developers should leverage the Interactions API to stack edits across up to 3 sequential conversation turns rather than overloading the initial request2.
    3. Explicit Continuity Stabilizers: Include explicit continuity directives such as "One continuous shot, no jump cuts" or "Flawless continuity" to preserve visual coherence across complex camera shifts1.
12. Failure Modes, Safety Filtering, and Technical Mitigations
Official documentation and developer logs highlight recurring failure modes alongside official mitigation protocols5.

Identified Failure Mode
Underlying Root Cause
Official Mitigation Protocol
Evidence Level
Official Source
False-Positive Safety Blocks
Benign prompts (e.g., color grading, costume edits) trigger automated safety filters.
Rephrase prompt instructions to remove ambiguous terms; report persistent false positives via AI Studio feedback.
Level A
12
Character Identity Drift
Fast camera pans or hard scene changes cause subject features to morph.
Supply multimodal reference assets (up to 3s video or keyframe image) to anchor features.
Level A
1
Preview Endpoint Reference Bug
Early preview endpoints accepted 3s video references but failed to process internal vectors.
Upgrade API calls from legacy preview endpoints to GA model gemini-omni-1.1-flash.
Level A
3
Motion Tearing & Artifacts
Overloading a prompt with simultaneous competing movements degrades physics rendering.
Simplify prompt scope to a single continuous motion path; stack additional edits conversationally.
Level B
2
Safety Filtering Specifications: Safety moderation filters content across four primary categories: HARM_CATEGORY_SEXUALLY_EXPLICIT, HARM_CATEGORY_HATE_SPEECH, HARM_CATEGORY_HARASSMENT, and HARM_CATEGORY_DANGEROUS_CONTENT, operating under a default blocking threshold of BLOCK_MEDIUM_AND_ABOVE13.
13. Comprehensive Official Prompt Analysis
The following section analyzes official Google prompt examples for Gemini Omni 1.1 Flash, detailing the specific technical mechanics demonstrated by each prompt1.
Example A: The Optical Dolly-Zoom Transition
Prompt: "Continue the video. Execute a cinematic optical dolly-zoom shot. The camera dollies forward while simultaneously zooming out, keeping the character's frozen shocked face locked at the exact same size. The long corridor of stone pillars in the background dramatically stretches and deepens with intense optical perspective distortion. Clean architecture, continuous unbroken shot."
1
    • Target Feature: Scene Extension & Optical Physics1
    • Demonstrated Mechanics: Demonstrates the model's ability to simulate complex camera optics (z-axis camera dolly coupled with inverse focal length zoom) while maintaining fixed subject dimensions and expanding background perspective depth1.
Example B: Frozen Time 360-Degree Orbital Rotation
Prompt: "Continue the video. Time completely freezes into a static moment: the character, their windblown coat. The camera performs a smooth, high-speed 360-degree orbital rotation around the frozen character, showcasing dramatic 3D depth and parallax across the colonnade. Flawless continuity."
1
    • Target Feature: 3D Spatial Reconstruction & Parallax1
    • Demonstrated Mechanics: Tests background parallax calculations and 3D spatial volume rendering around a frozen subject during a rapid 360-degree orbital camera move1.
Example C: Keyframe Whip-Pan Interpolation
Prompt: "A close-up low-angle shot of a stylish drummer in a beige suit playing a red drum kit in a grand hall transitions as the camera whip-pans to the side, revealing an older saxophonist playing alongside a ballet dancer spinning in a white outfit under soft purple stage lights. One continuous shot, no jump cuts."
1
    • Target Feature: First and Last Frame Interpolation1
    • Demonstrated Mechanics: Interpolates a continuous video sequence between two visual keyframes using a whip-pan camera blur, unifying different subjects and lighting environments into one unbroken shot1.
Example D: Scientific Microscopic Macro Simulation
Prompt: "A microscopic view of iridescent marine diatoms, displaying intricate, glass-like silica shells with breathtaking natural symmetry. The colors range from deep volcanic amber and warm copper to vibrant turquoise and violet, mimicking the rich palette of earth and ocean. Tiny, delicate structures glow softly against a clean dark field background. High-fidelity scientific imaging, sharp details, organic textures, micro-photography. Maintain the microscope lens effect throughout the entire video."
1
    • Target Feature: 360p Draft Previews & Micro-Optics1
    • Demonstrated Mechanics: Validates rendering of specialized visual domains (micro-photography, light refraction, dark-field illumination) while maintaining consistent optical lens constraints1.
Example E: Autumn Macro Close-Up with Subsurface Scattering
Prompt: "Cinematic macro close-up of vibrant golden-orange Japanese maple leaves on a delicate branch, gently rustling and swaying in a soft, rhythmic autumn breeze. Sunlight filters through the translucent foliage, creating a warm, glowing effect. Shallow depth of field, dreamy bokeh background, hyper-detailed textures, photorealistic, 4k."
1
    • Target Feature: 4K Upscaling & Material Physics1
    • Demonstrated Mechanics: Demonstrates high-resolution surface texturing, subsurface light transport through leaves, fine wind interactions, and background depth-of-field blur1.
Example F: Multimodal Character Asset Retargeting
Prompt: "Use the three uploaded videos of dancers and replace them with the provided characters. Have them perform their individual dances from the reference videos, all together in the large, open space from the provided image. The dog character dog.png should do the classical dance from dance3.mp4. The octopus octo.png should do the hip hop dance from dance1.mp4, and the bear bear.png should do the breakdance from dance2.mp4. The final result should be one continuous shot with no scene cuts."
1
    • Target Feature: Multi-Asset Multimodal Composition1
    • Demonstrated Mechanics: Extracts motion vectors from multiple reference video sources (dance1.mp4, dance2.mp4, dance3.mp4) and maps them onto static image characters (dog.png, octo.png, bear.png) within a single background environment1.
Example G: Abstract Drawing to Photorealistic Motion Guide
Prompt: "turn this into realistic footage, using the drawing only as a guide for movement, do not show the drawing in the final video"
2
    • Target Feature: Image-to-Video Trajectory Extraction2
    • Demonstrated Mechanics: Uses negative visual constraints (do not show the drawing in the final video) to isolate motion paths from schematic artwork and translate them into realistic video footage2.
14. Technical Lifecycle, API Specifications, and Cost Metrics
Integrating Gemini Omni 1.1 Flash into automated media workflows requires adhering to API payload constraints, execution schemas, and pricing structures2.
Python SDK Implementation Payload
Programmatic requests are executed via client.interactions.create2:



Python
import base64
from google import genai

client = genai.Client()
interaction = client.interactions.create(
    model="gemini-omni-1.1-flash",
    input=[
        {"type": "image", "data": base64_image, "mime_type": "image/jpeg"},
        {"type": "text", "text": "A futuristic city with neon lights and flying cars, cyberpunk style"}
    ],
    response_format={
        "type": "video",
        "aspect_ratio": "9:16",
        "resolution": "1080p"
    }
)

with open("output_shorts.mp4", "wb") as f:
    f.write(base64.b64decode(interaction.output_video.data))

Raw REST Handling: When using direct REST endpoints (POST https://generativelanguage.googleapis.com/v1beta/interactions), the SDK convenience field output_video is unavailable2. Developers must extract the Base64-encoded video string from the steps array within the JSON response under model_output where mime_type equals "video/mp4"2.
Production Pricing and Lifecycle Benchmarks

Parameter / Cost Metric
Official Pricing Tier / Benchmark
Expiration / Timeline Notes
Evidence Level
Official Source
Model GA Launch Date
August 27, 2026
Active GA endpoint: gemini-omni-1.1-flash
Level A
1
Preview Endpoint Sunset
gemini-omni-flash-preview
Deprecated as of September 30, 2026
Level A
3
Input Token Billing
$1.35 per 1M input tokens
Locked through Dec 31, 2026 ($2.70 starting Jan 1, 2027)
Level A
14
Output Token Billing
$6.75 per 1M output tokens
Locked through Dec 31, 2026 ($13.50 starting Jan 1, 2027)
Level A
14
Video Generation Cost
$0.10 per second of video output
Equivalent to Veo 3.1 Fast pricing benchmark
Level A
5
Context Cache Price
$0.135 per 1M tokens / hour
Locked through Dec 31, 2026 ($0.27 starting Jan 1, 2027)
Level A
14
Enterprise Agent Input
$1.50 per 1M input tokens
Standard PayGo rates on Enterprise Agent Platform
Level A
8
15. Master Reference Matrix
The following table synthesizes all officially documented capabilities, configuration parameters, operational constraints, and evidence classifications for Gemini Omni 1.1 Flash1.

Category
Omni 1.1 Flash Official Guidance
Evidence Level
Operational Limitations
Official Source
Model Identity
Official model ID is gemini-omni-1.1-flash. Replaces preview endpoint.
Level A
Preview endpoint deprecated on September 30, 2026.
2
Text-to-Video
Prompt with scene, camera, lighting, and mood details for full video+audio output.
Level A
Base generation length limited to 3–10 seconds.
2
Image-to-Video
Provide high-res images with explicit motion paths for subjects and cameras.
Level A
Vague prompts like "make it move" cause quality degradation.
2
First/Last Frame
Pass up to 2 images to interpolate continuous visual transitions between frames.
Level A
Prompts must describe full motion bridge between frames.
1
Scene Extension
Extends existing clips in 10s increments up to a total of 40s total length.
Level A
Analyzes a maximum of 10s of prior context.
1
360p Draft Mode
Lightweight preview mode rendering 60% faster at one-third standard cost.
Level A
Intended for storyboarding and prototyping only.
1
Upscaling (4K)
Upscales outputs to native 1080p or high-resolution 4K production standards.
Level A
Generated via internal upscaling pipeline.
1
Aspect Ratio
Supports "16:9" (Landscape default) and "9:16" (Portrait vertical Shorts).
Level A
Configured explicitly via SDK response_format.
2
Video Reference
Accepts up to 3 seconds of reference video input to anchor consistency.
Level A
Reference clips capped strictly at 3s length.
1
Subject Reference
Accepts distinct subject images to compose unified multi-character scenes.
Level A
Requires explicit tagging of file assets in text prompt.
1
Conversational Edit
Multi-turn edits via Interactions API modifying state while retaining context.
Level A
Supports stacking up to 3 sequential conversational edits.
2
Audio Generation
Generates synchronized speech, physical SFX, and musical scores natively.
Level A
Input audio uploads are explicitly unsupported.
1
Camera Control
Supports dolly-zoom, 360 orbits, snap-zooms, whip-pans, and pull-backs.
Level A
Specific focal length tags (mm) are undocumented.
1
Negative Prompting
Include simple natural language exclusion rules directly in prompt string.
Level A
No dedicated API JSON parameter for negative prompts.
2
Safety Filters
Standard safety policy applies across sexual, hate, harassment, and danger categories.
Level A
Harmless edits can occasionally cause false-positive blocks.
12
16. Unsupported Assumptions and Technical Gaps
To prevent prompt engineering failures caused by transferring unverified assumptions from other platforms, the following list outlines features and rules for which no official Google documentation exists specifically for gemini-omni-1.1-flash:
    • "Magic Quality Words": Google does not currently provide official Omni 1.1 Flash-specific documentation confirming that quality buzzwords (e.g., "8k octane render," "masterpiece," "trending on ArtStation") improve video generation quality2.
    • Dedicated Negative Prompt API Field: Google does not currently provide official Omni 1.1 Flash-specific documentation confirming a separate SDK JSON parameter field for negative prompts; exclusions must be written inline in natural language2.
    • Millimeter Focal Length Controls: Google does not currently provide official Omni 1.1 Flash-specific documentation confirming that numeric camera lens values (e.g., "35mm," "85mm f/1.4") are recognized by the model's physics engine1.
    • Audio Reference Uploads: Google explicitly confirms that uploading standalone external audio files as prompt references is unsupported for Gemini Omni 1.1 Flash5.
    • Guaranteed Identity Continuity: Google does not currently provide official Omni 1.1 Flash-specific documentation confirming 100% character identity preservation across aggressive camera pans or hard scene cuts without reference assets5.
    • Guaranteed Viral Performance or Engagement Rules: Google does not currently provide official Omni 1.1 Flash-specific documentation confirming prompt structures optimized for social media engagement metrics1.
    • Cross-Model Knowledge Transfer from Veo: Google does not currently provide official Omni 1.1 Flash-specific documentation confirming that prompting conventions specific to Veo models automatically apply to gemini-omni-1.1-flash unless explicitly cross-documented1.
17. Official Google Source Directory
    1. Google Blog: Build with Gemini Omni 1.1 Flash
https://blog.google/innovation-and-ai/technology/developers-tools/build-with-gemini-omni-1-1-flash/
1
    2. Google DeepMind Blog: Gemini Omni 1.1 Flash Lets You Build with More Control
https://deepmind.google/blog/gemini-omni-1-1-flash-lets-you-build-with-more-control/
[cite: 15, 16]
    3. Google DeepMind Blog: Start Building with Nano Banana 2 Lite and Gemini Omni Flash
https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-omni-flash-nano-banana-2-lite/
5
    4. Google AI Developer Documentation: Gemini Omni Flash Model Overview & API Guide
https://ai.google.dev/gemini-api/docs/omni
2
    5. Google AI Developer Documentation: Gemini API Models Directory
https://ai.google.dev/gemini-api/docs/models
[cite: 7, 9]
    6. Google AI Developer Documentation: Gemini API Changelog & Model Updates
https://ai.google.dev/gemini-api/docs/changelog
3
    7. Google AI Developer Documentation: Gemini API Pricing Schedule
https://ai.google.dev/gemini-api/docs/pricing
14
    8. Google AI Developer Documentation: General Prompting Strategies and Core Principles
https://ai.google.dev/gemini-api/docs/prompting-strategies
[cite: 11]
    9. Google AI Developer Documentation: Long Context & Context Window Mechanics
https://ai.google.dev/gemini-api/docs/long-context
[cite: 10]
    10. Google Cloud Documentation: Gemini Enterprise Agent Platform Model Specifications (Gemini Omni Flash Preview)
https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/gemini/omni-flash-preview
[cite: 4]
    11. Google Cloud Documentation: Gemini Enterprise Agent Platform Pricing
https://cloud.google.com/gemini-enterprise-agent-platform/generative-ai/pricing
8
    12. Google Cloud Documentation: System Instructions and Safety Configuration Guidelines
https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/prompts/system-instructions
[cite: 13]
    13. Google AI Developers Forum: Omni Video Editing Safety Filter Evaluation Threads
https://discuss.ai.google.dev/t/omni-video-editing-instantly-rejects-harmless-prompts-in-flow-and-gemini-app/147152
12
Works cited
    1. Gemini Omni 1.1 Flash lets you build with more control - Google Blog, https://blog.google/innovation-and-ai/technology/developers-tools/build-with-gemini-omni-1-1-flash/
    2. Generate and edit videos with Gemini Omni Flash | Gemini API, https://ai.google.dev/gemini-api/docs/omni
    3. Release notes | Gemini API - Google AI for Developers, https://ai.google.dev/gemini-api/docs/changelog
    4. Gemini Omni Flash Preview | Gemini Enterprise Agent Platform, https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/gemini/omni-flash-preview
    5. Start building with Nano Banana 2 Lite and Gemini Omni Flash, https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-omni-flash-nano-banana-2-lite/
    6. Techmeme, https://www.techmeme.com/260827/p38
    7. Gemini API | Google AI for Developers, https://ai.google.dev/gemini-api/docs
    8. Agent Platform Pricing | Google Cloud, https://cloud.google.com/gemini-enterprise-agent-platform/generative-ai/pricing
    9. Models | Gemini API - Google AI for Developers, https://ai.google.dev/gemini-api/docs/models
    10. Long context | Gemini API - Google AI for Developers, https://ai.google.dev/gemini-api/docs/long-context
    11. Prompt design strategies | Gemini API | Google AI for Developers, https://ai.google.dev/gemini-api/docs/prompting-strategies
    12. Omni video editing instantly rejects harmless prompts in Flow and, https://discuss.ai.google.dev/t/omni-video-editing-instantly-rejects-harmless-prompts-in-flow-and-gemini-app/147152
    13. Use system instructions | Gemini Enterprise Agent Platform, https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/prompts/system-instructions
    14. Gemini Developer API pricing, https://ai.google.dev/gemini-api/docs/pricing
    15. Gemini Omni 1.1 Flash lets you build with more control - Google Blog, https://deepmind.google/blog/gemini-omni-1-1-flash-lets-you-build-with-more-control/
    16. Start building with Nano Banana 2 Lite and Gemini Omni Flash, https://deepmind.google/blog/start-building-with-nano-banana-2-lite-and-gemini-omni-flash/
