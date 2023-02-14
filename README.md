# Intermediate-CG-Midterm
 Intermediate Comp Graphics Midterm Exam (Constantine Pallas 100822644)


The Force Field Shader was very similar to the hologram shader from the tutorial. I added a texture to sample transparency and a bool to toggle the effect.
[Force field Effect]-------[Transparency of Force Field]-------[Is force field enabled?] - [Sample force field strength texture]
                                                                          |
                                                             [full transparency (invisible)]


The Texture switching was written entirely by me. Depending on the state of a toggle, one of 2 textures will be sampled to be output as the shader's rgb values.
[Use texture 1?] - [Sample texture 1]
       | 
[Sample texture 2]
