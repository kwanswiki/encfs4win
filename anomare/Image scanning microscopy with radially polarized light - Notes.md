## Image scanning microscopy with radially polarized light

src: https://www.sciencedirect.com/science/article/pii/S0030401816310276

doi: https://doi.org/10.1016/j.optcom.2016.11.044



> the SNR of confocal microscopy image always improves at the cost of resolution [1], [2], [3].

共聚焦显微镜图像的信噪比总是以牺牲分辨率为代价而获得提高[1-3]。


> and realized subtractive imaging with high resolution in confocal microscopy by changing the number of the pixel as a pinhole [4]. Müller et al. proposed image scanning microscopy (ISM) combining the conventional confocal microscopy with the detection of a CCD and provided the theoretical base for improving resolution [5]. In the ISM, the illumination diffraction-limited laser focus is seen as a structured illumination carrying all the possible Fourier modes allowed by the NA of an objective [5].

通过改变作为针孔的探测 CCD 像素的数量，在共聚焦显微镜中实现了高分辨率的差分成像相减成像[4]。Muller 等人提出了结合传统共聚焦显微镜和以 CCD 为探测器的图像扫描显微镜（ISM），为提高分辨率提供了理论依据[5]。<span style="color: #DC143C">在 ISM 中，衍射受限激光的照明聚焦被视为携带着物镜的 NA 所允许的所有傅里叶模式的结构光照明。</span>


> Sheppard discussed the effect of the size of the detector on the ISM imaging by using pixel reassignment, and demonstrated the possibility to realize the imaging with high resolution and high SNR simultaneously [6].

Sheppard 讨论了探测器尺寸对 ISM 成像的影响，并论证了同时实现高分辨率、高信噪比的可能性[6]。


> Theoretical analyses are discussed according to Richard-Wolf vectorial diffraction theory, and we obtain a smaller effective PSF. 

根据 Richard-Wolf 矢量衍射理论，讨论了理论分析，并得到了较小的有效PSF。


> the image recorded by the point detector on the optical axis is expressed by

点探测器所记录的处于光轴上的图像可表达为


> the transmission function of the pinhole $p(\vec{r})$

针孔的透过率函数 $p(\vec{r})$


> Because of the point detector on the optical axis, the peaks of the illumination PSF, the effective detection PSF and the effective PSF are coincident on the optical axis, as are shown in Fig. 2(a) and (c).

在点探测器处于光轴上时，照明 PSF、有效探测 PSF 和有效 PSF 的峰值在光轴上重合，如图所示。


> the peak of the effective PSF for each detector element with different offset from the optical axis deviates from the optical axis. So the intensity distribution recorded by each detector element located at the position $\vec{s}$ can be rewritten by [6], [14]

每个与光轴偏移程度不同的探测器单元的有效 PSF 的峰值将会偏离光轴，因而每个处于  $\vec{s}$ 位置处的探测器单元所记录的光强分布可以改写为[6], [14]


> Table 1. Polarization and corresponding unit vector matrix 
>
> |                             Polarization                              | Linear X | Linear Y | Radial | Azimuthal | Right circular | Left circular | Ellipse X |
| :-------------------------------------------------------------------: | :------: | :------: | :----: | :-------: | :------------: | :-----------: | :-------: |
| $\left( \begin{array}{c} p_{x} \\ p_{y} \\ p_{z} \end{array} \right)$ |    $\left( \begin{array}{c} 1 \\ 0 \\ 0 \end{array} \right)$ |      $\left( \begin{array}{c} 0 \\ 1 \\ 0 \end{array} \right)$    |     $\left( \begin{array}{c} \cos \phi \\ \sin \phi \\ 0 \end{array} \right)$   |    $\left( \begin{array}{c} - \sin \phi \\ \cos \phi \\ 0 \end{array} \right)$       |        refer\*        |      refer\*        |     refer\*      |
>
> refer\*: refer to the article

<span style="color: #DC143C">各种偏振态对应的单位矢量矩阵</span>


> When implementing the ISM, the resolution for the longitudinal component of the radially polarized light is enhanced by 7% compared with the circularly polarized light.

在实现 ISM 时，径向偏振光纵向分量的分辨率比圆偏振光提高了 $7%$


> Besides, the resolution can be evaluated by the optical transfer function (OTF). The larger spatial cutoff frequency and more high spatial frequencies could generate higher resolution. The cross sections of the 2D OTFs corresponding to the PSFs shown in Fig. 6(a) are shown in Fig. 6(b). We can see that the OTF of the confocal microscopy with a pinhole of 1 AU has the smallest spatial cutoff frequency and less high spatial frequencies to result in a worse resolution. The ISM with the longitudinal component of the radially polarized light has a spatial cutoff frequency approached to the circularly polarized light, but it has more high spatial frequencies than the circularly polarized light. The calculation results show that the resolution for the ISM with radially polarized light is higher than that for the circularly polarized light, and is 1.54-fold higher than that in confocal microscopy with a pinhole of 1 AU.

此外，还可以通过光学传递函数（OTF）来评估分辨率。更大的空间截止频率和更多的高空间频率成分可以产生更高的分辨率。对应于 PSF 的二维 OTF 横截面分布如图6所示。径向偏振光的纵向场成分实现的 ISM 有着接近圆偏振的截止空间频率，但是其高空间频率的成分更多。计算的结果显示，径向偏振光实现的 ISM 比圆偏振有着更高的空间频率，且在 1 AU 大小的针孔下分辨率约比传统共聚焦提高 1.54 倍。




