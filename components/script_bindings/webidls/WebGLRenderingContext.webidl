/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */
//
// WebGL IDL definitions scraped from the Khronos specification:
// https://www.khronos.org/registry/webgl/specs/latest/
//
// This IDL depends on the typed array specification defined at:
// https://www.khronos.org/registry/typedarray/specs/latest/typedarrays.idl

typedef unsigned long  GLenum;
typedef boolean        GLboolean;
typedef unsigned long  GLbitfield;
typedef byte           GLbyte;         /* 'byte' should be a signed 8 bit type. */
typedef short          GLshort;
typedef long           GLint;
typedef long           GLsizei;
typedef long long      GLintptr;
typedef long long      GLsizeiptr;
// Ideally the typedef below would use 'unsigned byte', but that doesn't currently exist in Web IDL.
typedef octet          GLubyte;        /* 'octet' should be an unsigned 8 bit type. */
typedef unsigned short GLushort;
typedef unsigned long  GLuint;
typedef unrestricted float GLfloat;
typedef unrestricted float GLclampf;

typedef (ImageBitmap or
         ImageData or
         HTMLImageElement or
         HTMLCanvasElement or
         HTMLVideoElement) TexImageSource;

typedef (/*[AllowShared]*/ Float32Array or sequence<GLfloat>) Float32List;
typedef (/*[AllowShared]*/ Int32Array or sequence<GLint>) Int32List;

dictionary WebGLContextAttributes {
    GLboolean alpha = true;
    GLboolean depth = true;
    GLboolean stencil = false;
    GLboolean antialias = true;
    GLboolean premultipliedAlpha = true;
    GLboolean preserveDrawingBuffer = false;
    GLboolean preferLowPowerToHighPerformance = false;
    GLboolean failIfMajorPerformanceCaveat = false;
};

[Exposed=(Window,Worker)]
interface mixin WebGLRenderingContextBase
{

    /* ClearBufferMask */
    const GLenum DEPTH_BUFFER_BIT               = 0x00000100;
    const GLenum STENCIL_BUFFER_BIT             = 0x00000400;
    const GLenum COLOR_BUFFER_BIT               = 0x00004000;

    /* BeginMode */
    const GLenum POINTS                         = 0x0000;
    const GLenum LINES                          = 0x0001;
    const GLenum LINE_LOOP                      = 0x0002;
    const GLenum LINE_STRIP                     = 0x0003;
    const GLenum TRIANGLES                      = 0x0004;
    const GLenum TRIANGLE_STRIP                 = 0x0005;
    const GLenum TRIANGLE_FAN                   = 0x0006;

    /* AlphaFunction (not supported in ES20) */
    /*      NEVER */
    /*      LESS */
    /*      EQUAL */
    /*      LEQUAL */
    /*      GREATER */
    /*      NOTEQUAL */
    /*      GEQUAL */
    /*      ALWAYS */

    /* BlendingFactorDest */
    const GLenum ZERO                           = 0;
    const GLenum ONE                            = 1;
    const GLenum SRC_COLOR                      = 0x0300;
    const GLenum ONE_MINUS_SRC_COLOR            = 0x0301;
    const GLenum SRC_ALPHA                      = 0x0302;
    const GLenum ONE_MINUS_SRC_ALPHA            = 0x0303;
    const GLenum DST_ALPHA                      = 0x0304;
    const GLenum ONE_MINUS_DST_ALPHA            = 0x0305;

    /* BlendingFactorSrc */
    /*      ZERO */
    /*      ONE */
    const GLenum DST_COLOR                      = 0x0306;
    const GLenum ONE_MINUS_DST_COLOR            = 0x0307;
    const GLenum SRC_ALPHA_SATURATE             = 0x0308;
    /*      SRC_ALPHA */
    /*      ONE_MINUS_SRC_ALPHA */
    /*      DST_ALPHA */
    /*      ONE_MINUS_DST_ALPHA */

    /* BlendEquationSeparate */
    const GLenum FUNC_ADD                       = 0x8006;
    const GLenum BLEND_EQUATION                 = 0x8009;
    const GLenum BLEND_EQUATION_RGB             = 0x8009;   /* same as BLEND_EQUATION */
    const GLenum BLEND_EQUATION_ALPHA           = 0x883D;

    /* BlendSubtract */
    const GLenum FUNC_SUBTRACT                  = 0x800A;
    const GLenum FUNC_REVERSE_SUBTRACT          = 0x800B;

    /* Separate Blend Functions */
    const GLenum BLEND_DST_RGB                  = 0x80C8;
    const GLenum BLEND_SRC_RGB                  = 0x80C9;
    const GLenum BLEND_DST_ALPHA                = 0x80CA;
    const GLenum BLEND_SRC_ALPHA                = 0x80CB;
    const GLenum CONSTANT_COLOR                 = 0x8001;
    const GLenum ONE_MINUS_CONSTANT_COLOR       = 0x8002;
    const GLenum CONSTANT_ALPHA                 = 0x8003;
    const GLenum ONE_MINUS_CONSTANT_ALPHA       = 0x8004;
    const GLenum BLEND_COLOR                    = 0x8005;

    /* Buffer Objects */
    const GLenum ARRAY_BUFFER                   = 0x8892;
    const GLenum ELEMENT_ARRAY_BUFFER           = 0x8893;
    const GLenum ARRAY_BUFFER_BINDING           = 0x8894;
    const GLenum ELEMENT_ARRAY_BUFFER_BINDING   = 0x8895;

    const GLenum STREAM_DRAW                    = 0x88E0;
    const GLenum STATIC_DRAW                    = 0x88E4;
    const GLenum DYNAMIC_DRAW                   = 0x88E8;

    const GLenum BUFFER_SIZE                    = 0x8764;
    const GLenum BUFFER_USAGE                   = 0x8765;

    const GLenum CURRENT_VERTEX_ATTRIB          = 0x8626;

    /* CullFaceMode */
    const GLenum FRONT                          = 0x0404;
    const GLenum BACK                           = 0x0405;
    const GLenum FRONT_AND_BACK                 = 0x0408;

    /* DepthFunction */
    /*      NEVER */
    /*      LESS */
    /*      EQUAL */
    /*      LEQUAL */
    /*      GREATER */
    /*      NOTEQUAL */
    /*      GEQUAL */
    /*      ALWAYS */

    /* EnableCap */
    /* TEXTURE_2D */
    const GLenum CULL_FACE                      = 0x0B44;
    const GLenum BLEND                          = 0x0BE2;
    const GLenum DITHER                         = 0x0BD0;
    const GLenum STENCIL_TEST                   = 0x0B90;
    const GLenum DEPTH_TEST                     = 0x0B71;
    const GLenum SCISSOR_TEST                   = 0x0C11;
    const GLenum POLYGON_OFFSET_FILL            = 0x8037;
    const GLenum SAMPLE_ALPHA_TO_COVERAGE       = 0x809E;
    const GLenum SAMPLE_COVERAGE                = 0x80A0;

    /* ErrorCode */
    const GLenum NO_ERROR                       = 0;
    const GLenum INVALID_ENUM                   = 0x0500;
    const GLenum INVALID_VALUE                  = 0x0501;
    const GLenum INVALID_OPERATION              = 0x0502;
    const GLenum OUT_OF_MEMORY                  = 0x0505;

    /* FrontFaceDirection */
    const GLenum CW                             = 0x0900;
    const GLenum CCW                            = 0x0901;

    /* GetPName */
    const GLenum LINE_WIDTH                     = 0x0B21;
    const GLenum ALIASED_POINT_SIZE_RANGE       = 0x846D;
    const GLenum ALIASED_LINE_WIDTH_RANGE       = 0x846E;
    const GLenum CULL_FACE_MODE                 = 0x0B45;
    const GLenum FRONT_FACE                     = 0x0B46;
    const GLenum DEPTH_RANGE                    = 0x0B70;
    const GLenum DEPTH_WRITEMASK                = 0x0B72;
    const GLenum DEPTH_CLEAR_VALUE              = 0x0B73;
    const GLenum DEPTH_FUNC                     = 0x0B74;
    const GLenum STENCIL_CLEAR_VALUE            = 0x0B91;
    const GLenum STENCIL_FUNC                   = 0x0B92;
    const GLenum STENCIL_FAIL                   = 0x0B94;
    const GLenum STENCIL_PASS_DEPTH_FAIL        = 0x0B95;
    const GLenum STENCIL_PASS_DEPTH_PASS        = 0x0B96;
    const GLenum STENCIL_REF                    = 0x0B97;
    const GLenum STENCIL_VALUE_MASK             = 0x0B93;
    const GLenum STENCIL_WRITEMASK              = 0x0B98;
    const GLenum STENCIL_BACK_FUNC              = 0x8800;
    const GLenum STENCIL_BACK_FAIL              = 0x8801;
    const GLenum STENCIL_BACK_PASS_DEPTH_FAIL   = 0x8802;
    const GLenum STENCIL_BACK_PASS_DEPTH_PASS   = 0x8803;
    const GLenum STENCIL_BACK_REF               = 0x8CA3;
    const GLenum STENCIL_BACK_VALUE_MASK        = 0x8CA4;
    const GLenum STENCIL_BACK_WRITEMASK         = 0x8CA5;
    const GLenum VIEWPORT                       = 0x0BA2;
    const GLenum SCISSOR_BOX                    = 0x0C10;
    /*      SCISSOR_TEST */
    const GLenum COLOR_CLEAR_VALUE              = 0x0C22;
    const GLenum COLOR_WRITEMASK                = 0x0C23;
    const GLenum UNPACK_ALIGNMENT               = 0x0CF5;
    const GLenum PACK_ALIGNMENT                 = 0x0D05;
    const GLenum MAX_TEXTURE_SIZE               = 0x0D33;
    const GLenum MAX_VIEWPORT_DIMS              = 0x0D3A;
    const GLenum SUBPIXEL_BITS                  = 0x0D50;
    const GLenum RED_BITS                       = 0x0D52;
    const GLenum GREEN_BITS                     = 0x0D53;
    const GLenum BLUE_BITS                      = 0x0D54;
    const GLenum ALPHA_BITS                     = 0x0D55;
    const GLenum DEPTH_BITS                     = 0x0D56;
    const GLenum STENCIL_BITS                   = 0x0D57;
    const GLenum POLYGON_OFFSET_UNITS           = 0x2A00;
    /*      POLYGON_OFFSET_FILL */
    const GLenum POLYGON_OFFSET_FACTOR          = 0x8038;
    const GLenum TEXTURE_BINDING_2D             = 0x8069;
    const GLenum SAMPLE_BUFFERS                 = 0x80A8;
    const GLenum SAMPLES                        = 0x80A9;
    const GLenum SAMPLE_COVERAGE_VALUE          = 0x80AA;
    const GLenum SAMPLE_COVERAGE_INVERT         = 0x80AB;

    /* GetTextureParameter */
    /*      TEXTURE_MAG_FILTER */
    /*      TEXTURE_MIN_FILTER */
    /*      TEXTURE_WRAP_S */
    /*      TEXTURE_WRAP_T */

    const GLenum COMPRESSED_TEXTURE_FORMATS     = 0x86A3;

    /* HintMode */
    const GLenum DONT_CARE                      = 0x1100;
    const GLenum FASTEST                        = 0x1101;
    const GLenum NICEST                         = 0x1102;

    /* HintTarget */
    const GLenum GENERATE_MIPMAP_HINT            = 0x8192;

    /* DataType */
    const GLenum BYTE                           = 0x1400;
    const GLenum UNSIGNED_BYTE                  = 0x1401;
    const GLenum SHORT                          = 0x1402;
    const GLenum UNSIGNED_SHORT                 = 0x1403;
    const GLenum INT                            = 0x1404;
    const GLenum UNSIGNED_INT                   = 0x1405;
    const GLenum FLOAT                          = 0x1406;

    /* PixelFormat */
    const GLenum DEPTH_COMPONENT                = 0x1902;
    const GLenum ALPHA                          = 0x1906;
    const GLenum RGB                            = 0x1907;
    const GLenum RGBA                           = 0x1908;
    const GLenum LUMINANCE                      = 0x1909;
    const GLenum LUMINANCE_ALPHA                = 0x190A;

    /* PixelType */
    /*      UNSIGNED_BYTE */
    const GLenum UNSIGNED_SHORT_4_4_4_4         = 0x8033;
    const GLenum UNSIGNED_SHORT_5_5_5_1         = 0x8034;
    const GLenum UNSIGNED_SHORT_5_6_5           = 0x8363;

    /* Shaders */
    const GLenum FRAGMENT_SHADER                  = 0x8B30;
    const GLenum VERTEX_SHADER                    = 0x8B31;
    const GLenum MAX_VERTEX_ATTRIBS               = 0x8869;
    const GLenum MAX_VERTEX_UNIFORM_VECTORS       = 0x8DFB;
    const GLenum MAX_VARYING_VECTORS              = 0x8DFC;
    const GLenum MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
    const GLenum MAX_VERTEX_TEXTURE_IMAGE_UNITS   = 0x8B4C;
    const GLenum MAX_TEXTURE_IMAGE_UNITS          = 0x8872;
    const GLenum MAX_FRAGMENT_UNIFORM_VECTORS     = 0x8DFD;
    const GLenum SHADER_TYPE                      = 0x8B4F;
    const GLenum DELETE_STATUS                    = 0x8B80;
    const GLenum LINK_STATUS                      = 0x8B82;
    const GLenum VALIDATE_STATUS                  = 0x8B83;
    const GLenum ATTACHED_SHADERS                 = 0x8B85;
    const GLenum ACTIVE_UNIFORMS                  = 0x8B86;
    const GLenum ACTIVE_ATTRIBUTES                = 0x8B89;
    const GLenum SHADING_LANGUAGE_VERSION         = 0x8B8C;
    const GLenum CURRENT_PROGRAM                  = 0x8B8D;

    /* StencilFunction */
    const GLenum NEVER                          = 0x0200;
    const GLenum LESS                           = 0x0201;
    const GLenum EQUAL                          = 0x0202;
    const GLenum LEQUAL                         = 0x0203;
    const GLenum GREATER                        = 0x0204;
    const GLenum NOTEQUAL                       = 0x0205;
    const GLenum GEQUAL                         = 0x0206;
    const GLenum ALWAYS                         = 0x0207;

    /* StencilOp */
    /*      ZERO */
    const GLenum KEEP                           = 0x1E00;
    const GLenum REPLACE                        = 0x1E01;
    const GLenum INCR                           = 0x1E02;
    const GLenum DECR                           = 0x1E03;
    const GLenum INVERT                         = 0x150A;
    const GLenum INCR_WRAP                      = 0x8507;
    const GLenum DECR_WRAP                      = 0x8508;

    /* StringName */
    const GLenum VENDOR                         = 0x1F00;
    const GLenum RENDERER                       = 0x1F01;
    const GLenum VERSION                        = 0x1F02;

    /* TextureMagFilter */
    const GLenum NEAREST                        = 0x2600;
    const GLenum LINEAR                         = 0x2601;

    /* TextureMinFilter */
    /*      NEAREST */
    /*      LINEAR */
    const GLenum NEAREST_MIPMAP_NEAREST         = 0x2700;
    const GLenum LINEAR_MIPMAP_NEAREST          = 0x2701;
    const GLenum NEAREST_MIPMAP_LINEAR          = 0x2702;
    const GLenum LINEAR_MIPMAP_LINEAR           = 0x2703;

    /* TextureParameterName */
    const GLenum TEXTURE_MAG_FILTER             = 0x2800;
    const GLenum TEXTURE_MIN_FILTER             = 0x2801;
    const GLenum TEXTURE_WRAP_S                 = 0x2802;
    const GLenum TEXTURE_WRAP_T                 = 0x2803;

    /* TextureTarget */
    const GLenum TEXTURE_2D                     = 0x0DE1;
    const GLenum TEXTURE                        = 0x1702;

    const GLenum TEXTURE_CUBE_MAP               = 0x8513;
    const GLenum TEXTURE_BINDING_CUBE_MAP       = 0x8514;
    const GLenum TEXTURE_CUBE_MAP_POSITIVE_X    = 0x8515;
    const GLenum TEXTURE_CUBE_MAP_NEGATIVE_X    = 0x8516;
    const GLenum TEXTURE_CUBE_MAP_POSITIVE_Y    = 0x8517;
    const GLenum TEXTURE_CUBE_MAP_NEGATIVE_Y    = 0x8518;
    const GLenum TEXTURE_CUBE_MAP_POSITIVE_Z    = 0x8519;
    const GLenum TEXTURE_CUBE_MAP_NEGATIVE_Z    = 0x851A;
    const GLenum MAX_CUBE_MAP_TEXTURE_SIZE      = 0x851C;

    /* TextureUnit */
    const GLenum TEXTURE0                       = 0x84C0;
    const GLenum TEXTURE1                       = 0x84C1;
    const GLenum TEXTURE2                       = 0x84C2;
    const GLenum TEXTURE3                       = 0x84C3;
    const GLenum TEXTURE4                       = 0x84C4;
    const GLenum TEXTURE5                       = 0x84C5;
    const GLenum TEXTURE6                       = 0x84C6;
    const GLenum TEXTURE7                       = 0x84C7;
    const GLenum TEXTURE8                       = 0x84C8;
    const GLenum TEXTURE9                       = 0x84C9;
    const GLenum TEXTURE10                      = 0x84CA;
    const GLenum TEXTURE11                      = 0x84CB;
    const GLenum TEXTURE12                      = 0x84CC;
    const GLenum TEXTURE13                      = 0x84CD;
    const GLenum TEXTURE14                      = 0x84CE;
    const GLenum TEXTURE15                      = 0x84CF;
    const GLenum TEXTURE16                      = 0x84D0;
    const GLenum TEXTURE17                      = 0x84D1;
    const GLenum TEXTURE18                      = 0x84D2;
    const GLenum TEXTURE19                      = 0x84D3;
    const GLenum TEXTURE20                      = 0x84D4;
    const GLenum TEXTURE21                      = 0x84D5;
    const GLenum TEXTURE22                      = 0x84D6;
    const GLenum TEXTURE23                      = 0x84D7;
    const GLenum TEXTURE24                      = 0x84D8;
    const GLenum TEXTURE25                      = 0x84D9;
    const GLenum TEXTURE26                      = 0x84DA;
    const GLenum TEXTURE27                      = 0x84DB;
    const GLenum TEXTURE28                      = 0x84DC;
    const GLenum TEXTURE29                      = 0x84DD;
    const GLenum TEXTURE30                      = 0x84DE;
    const GLenum TEXTURE31                      = 0x84DF;
    const GLenum ACTIVE_TEXTURE                 = 0x84E0;

    /* TextureWrapMode */
    const GLenum REPEAT                         = 0x2901;
    const GLenum CLAMP_TO_EDGE                  = 0x812F;
    const GLenum MIRRORED_REPEAT                = 0x8370;

    /* Uniform Types */
    const GLenum FLOAT_VEC2                     = 0x8B50;
    const GLenum FLOAT_VEC3                     = 0x8B51;
    const GLenum FLOAT_VEC4                     = 0x8B52;
    const GLenum INT_VEC2                       = 0x8B53;
    const GLenum INT_VEC3                       = 0x8B54;
    const GLenum INT_VEC4                       = 0x8B55;
    const GLenum BOOL                           = 0x8B56;
    const GLenum BOOL_VEC2                      = 0x8B57;
    const GLenum BOOL_VEC3                      = 0x8B58;
    const GLenum BOOL_VEC4                      = 0x8B59;
    const GLenum FLOAT_MAT2                     = 0x8B5A;
    const GLenum FLOAT_MAT3                     = 0x8B5B;
    const GLenum FLOAT_MAT4                     = 0x8B5C;
    const GLenum SAMPLER_2D                     = 0x8B5E;
    const GLenum SAMPLER_CUBE                   = 0x8B60;

    /* Vertex Arrays */
    const GLenum VERTEX_ATTRIB_ARRAY_ENABLED        = 0x8622;
    const GLenum VERTEX_ATTRIB_ARRAY_SIZE           = 0x8623;
    const GLenum VERTEX_ATTRIB_ARRAY_STRIDE         = 0x8624;
    const GLenum VERTEX_ATTRIB_ARRAY_TYPE           = 0x8625;
    const GLenum VERTEX_ATTRIB_ARRAY_NORMALIZED     = 0x886A;
    const GLenum VERTEX_ATTRIB_ARRAY_POINTER        = 0x8645;
    const GLenum VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;

    /* Read Format */
    const GLenum IMPLEMENTATION_COLOR_READ_TYPE   = 0x8B9A;
    const GLenum IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B;

    /* Shader Source */
    const GLenum COMPILE_STATUS                 = 0x8B81;

    /* Shader Precision-Specified Types */
    const GLenum LOW_FLOAT                      = 0x8DF0;
    const GLenum MEDIUM_FLOAT                   = 0x8DF1;
    const GLenum HIGH_FLOAT                     = 0x8DF2;
    const GLenum LOW_INT                        = 0x8DF3;
    const GLenum MEDIUM_INT                     = 0x8DF4;
    const GLenum HIGH_INT                       = 0x8DF5;

    /* Framebuffer Object. */
    const GLenum FRAMEBUFFER                    = 0x8D40;
    const GLenum RENDERBUFFER                   = 0x8D41;

    const GLenum RGBA4                          = 0x8056;
    const GLenum RGB5_A1                        = 0x8057;
    const GLenum RGB565                         = 0x8D62;
    const GLenum DEPTH_COMPONENT16              = 0x81A5;
    const GLenum STENCIL_INDEX8                 = 0x8D48;
    const GLenum DEPTH_STENCIL                  = 0x84F9;

    const GLenum RENDERBUFFER_WIDTH             = 0x8D42;
    const GLenum RENDERBUFFER_HEIGHT            = 0x8D43;
    const GLenum RENDERBUFFER_INTERNAL_FORMAT   = 0x8D44;
    const GLenum RENDERBUFFER_RED_SIZE          = 0x8D50;
    const GLenum RENDERBUFFER_GREEN_SIZE        = 0x8D51;
    const GLenum RENDERBUFFER_BLUE_SIZE         = 0x8D52;
    const GLenum RENDERBUFFER_ALPHA_SIZE        = 0x8D53;
    const GLenum RENDERBUFFER_DEPTH_SIZE        = 0x8D54;
    const GLenum RENDERBUFFER_STENCIL_SIZE      = 0x8D55;

    const GLenum FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE           = 0x8CD0;
    const GLenum FRAMEBUFFER_ATTACHMENT_OBJECT_NAME           = 0x8CD1;
    const GLenum FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL         = 0x8CD2;
    const GLenum FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;

    const GLenum COLOR_ATTACHMENT0              = 0x8CE0;
    const GLenum DEPTH_ATTACHMENT               = 0x8D00;
    const GLenum STENCIL_ATTACHMENT             = 0x8D20;
    const GLenum DEPTH_STENCIL_ATTACHMENT       = 0x821A;

    const GLenum NONE                           = 0;

    const GLenum FRAMEBUFFER_COMPLETE                      = 0x8CD5;
    const GLenum FRAMEBUFFER_INCOMPLETE_ATTACHMENT         = 0x8CD6;
    const GLenum FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
    const GLenum FRAMEBUFFER_INCOMPLETE_DIMENSIONS         = 0x8CD9;
    const GLenum FRAMEBUFFER_UNSUPPORTED                   = 0x8CDD;

    const GLenum FRAMEBUFFER_BINDING            = 0x8CA6;
    const GLenum RENDERBUFFER_BINDING           = 0x8CA7;
    const GLenum MAX_RENDERBUFFER_SIZE          = 0x84E8;

    const GLenum INVALID_FRAMEBUFFER_OPERATION  = 0x0506;

    /* WebGL-specific enums */
    const GLenum UNPACK_FLIP_Y_WEBGL            = 0x9240;
    const GLenum UNPACK_PREMULTIPLY_ALPHA_WEBGL = 0x9241;
    const GLenum CONTEXT_LOST_WEBGL             = 0x9242;
    const GLenum UNPACK_COLORSPACE_CONVERSION_WEBGL = 0x9243;
    const GLenum BROWSER_DEFAULT_WEBGL          = 0x9244;

    readonly attribute (HTMLCanvasElement or OffscreenCanvas) canvas;
    readonly attribute GLsizei drawingBufferWidth;
    readonly attribute GLsizei drawingBufferHeight;

    [WebGLHandlesContextLoss] WebGLContextAttributes? getContextAttributes();
    [WebGLHandlesContextLoss] boolean isContextLost();

    sequence<DOMString>? getSupportedExtensions();
    object? getExtension(DOMString name);

    undefined activeTexture(GLenum texture);
    undefined attachShader(WebGLProgram program, WebGLShader shader);
    undefined bindAttribLocation(WebGLProgram program, GLuint index, DOMString name);
    undefined bindBuffer(GLenum target, WebGLBuffer? buffer);
    undefined bindFramebuffer(GLenum target, WebGLFramebuffer? framebuffer);
    undefined bindRenderbuffer(GLenum target, WebGLRenderbuffer? renderbuffer);
    undefined bindTexture(GLenum target, WebGLTexture? texture);
    undefined blendColor(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
    undefined blendEquation(GLenum mode);
    undefined blendEquationSeparate(GLenum modeRGB, GLenum modeAlpha);
    undefined blendFunc(GLenum sfactor, GLenum dfactor);
    undefined blendFuncSeparate(GLenum srcRGB, GLenum dstRGB,
                           GLenum srcAlpha, GLenum dstAlpha);

    [WebGLHandlesContextLoss] GLenum checkFramebufferStatus(GLenum target);
    undefined clear(GLbitfield mask);
    undefined clearColor(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
    undefined clearDepth(GLclampf depth);
    undefined clearStencil(GLint s);
    undefined colorMask(GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
    undefined compileShader(WebGLShader shader);

    undefined copyTexImage2D(GLenum target, GLint level, GLenum internalformat,
                        GLint x, GLint y, GLsizei width, GLsizei height,
                        GLint border);
    undefined copyTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset,
                           GLint x, GLint y, GLsizei width, GLsizei height);

    WebGLBuffer? createBuffer();
    WebGLFramebuffer? createFramebuffer();
    WebGLProgram? createProgram();
    WebGLRenderbuffer? createRenderbuffer();
    WebGLShader? createShader(GLenum type);
    WebGLTexture? createTexture();

    undefined cullFace(GLenum mode);

    undefined deleteBuffer(WebGLBuffer? buffer);
    undefined deleteFramebuffer(WebGLFramebuffer? framebuffer);
    undefined deleteProgram(WebGLProgram? program);
    undefined deleteRenderbuffer(WebGLRenderbuffer? renderbuffer);
    undefined deleteShader(WebGLShader? shader);
    undefined deleteTexture(WebGLTexture? texture);

    undefined depthFunc(GLenum func);
    undefined depthMask(GLboolean flag);
    undefined depthRange(GLclampf zNear, GLclampf zFar);
    undefined detachShader(WebGLProgram program, WebGLShader shader);
    undefined disable(GLenum cap);
    undefined disableVertexAttribArray(GLuint index);
    undefined drawArrays(GLenum mode, GLint first, GLsizei count);
    undefined drawElements(GLenum mode, GLsizei count, GLenum type, GLintptr offset);

    undefined enable(GLenum cap);
    undefined enableVertexAttribArray(GLuint index);
    undefined finish();
    undefined flush();
    undefined framebufferRenderbuffer(GLenum target, GLenum attachment,
                                 GLenum renderbuffertarget,
                                 WebGLRenderbuffer? renderbuffer);
    undefined framebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget,
                              WebGLTexture? texture, GLint level);
    undefined frontFace(GLenum mode);

    undefined generateMipmap(GLenum target);

    WebGLActiveInfo? getActiveAttrib(WebGLProgram program, GLuint index);
    WebGLActiveInfo? getActiveUniform(WebGLProgram program, GLuint index);
    sequence<WebGLShader>? getAttachedShaders(WebGLProgram program);

    [WebGLHandlesContextLoss] GLint getAttribLocation(WebGLProgram program, DOMString name);

    any getBufferParameter(GLenum target, GLenum pname);
    any getParameter(GLenum pname);

    [WebGLHandlesContextLoss] GLenum getError();

    any getFramebufferAttachmentParameter(GLenum target, GLenum attachment,
                                          GLenum pname);
    any getProgramParameter(WebGLProgram program, GLenum pname);
    DOMString? getProgramInfoLog(WebGLProgram program);
    any getRenderbufferParameter(GLenum target, GLenum pname);
    any getShaderParameter(WebGLShader shader, GLenum pname);
    WebGLShaderPrecisionFormat? getShaderPrecisionFormat(GLenum shadertype, GLenum precisiontype);
    DOMString? getShaderInfoLog(WebGLShader shader);

    DOMString? getShaderSource(WebGLShader shader);

    any getTexParameter(GLenum target, GLenum pname);

    any getUniform(WebGLProgram program, WebGLUniformLocation location);

    WebGLUniformLocation? getUniformLocation(WebGLProgram program, DOMString name);

    any getVertexAttrib(GLuint index, GLenum pname);

    [WebGLHandlesContextLoss] GLsizeiptr getVertexAttribOffset(GLuint index, GLenum pname);

    undefined hint(GLenum target, GLenum mode);
    [WebGLHandlesContextLoss] GLboolean isBuffer(WebGLBuffer? buffer);
    [WebGLHandlesContextLoss] GLboolean isEnabled(GLenum cap);
    [WebGLHandlesContextLoss] GLboolean isFramebuffer(WebGLFramebuffer? framebuffer);
    [WebGLHandlesContextLoss] GLboolean isProgram(WebGLProgram? program);
    [WebGLHandlesContextLoss] GLboolean isRenderbuffer(WebGLRenderbuffer? renderbuffer);
    [WebGLHandlesContextLoss] GLboolean isShader(WebGLShader? shader);
    [WebGLHandlesContextLoss] GLboolean isTexture(WebGLTexture? texture);
    undefined lineWidth(GLfloat width);
    undefined linkProgram(WebGLProgram program);
    undefined pixelStorei(GLenum pname, GLint param);
    undefined polygonOffset(GLfloat factor, GLfloat units);

    undefined renderbufferStorage(GLenum target, GLenum internalformat,
                             GLsizei width, GLsizei height);
    undefined sampleCoverage(GLclampf value, GLboolean invert);
    undefined scissor(GLint x, GLint y, GLsizei width, GLsizei height);

    undefined shaderSource(WebGLShader shader, DOMString source);

    undefined stencilFunc(GLenum func, GLint ref, GLuint mask);
    undefined stencilFuncSeparate(GLenum face, GLenum func, GLint ref, GLuint mask);
    undefined stencilMask(GLuint mask);
    undefined stencilMaskSeparate(GLenum face, GLuint mask);
    undefined stencilOp(GLenum fail, GLenum zfail, GLenum zpass);
    undefined stencilOpSeparate(GLenum face, GLenum fail, GLenum zfail, GLenum zpass);

    undefined texParameterf(GLenum target, GLenum pname, GLfloat param);
    undefined texParameteri(GLenum target, GLenum pname, GLint param);

    undefined uniform1f(WebGLUniformLocation? location, GLfloat x);
    undefined uniform2f(WebGLUniformLocation? location, GLfloat x, GLfloat y);
    undefined uniform3f(WebGLUniformLocation? location, GLfloat x, GLfloat y, GLfloat z);
    undefined uniform4f(WebGLUniformLocation? location, GLfloat x, GLfloat y, GLfloat z, GLfloat w);

    undefined uniform1i(WebGLUniformLocation? location, GLint x);
    undefined uniform2i(WebGLUniformLocation? location, GLint x, GLint y);
    undefined uniform3i(WebGLUniformLocation? location, GLint x, GLint y, GLint z);
    undefined uniform4i(WebGLUniformLocation? location, GLint x, GLint y, GLint z, GLint w);

    undefined useProgram(WebGLProgram? program);
    undefined validateProgram(WebGLProgram program);

    undefined vertexAttrib1f(GLuint indx, GLfloat x);
    undefined vertexAttrib2f(GLuint indx, GLfloat x, GLfloat y);
    undefined vertexAttrib3f(GLuint indx, GLfloat x, GLfloat y, GLfloat z);
    undefined vertexAttrib4f(GLuint indx, GLfloat x, GLfloat y, GLfloat z, GLfloat w);

    undefined vertexAttrib1fv(GLuint indx, Float32List values);
    undefined vertexAttrib2fv(GLuint indx, Float32List values);
    undefined vertexAttrib3fv(GLuint indx, Float32List values);
    undefined vertexAttrib4fv(GLuint indx, Float32List values);

    undefined vertexAttribPointer(GLuint indx, GLint size, GLenum type,
                             GLboolean normalized, GLsizei stride, GLintptr offset);

    undefined viewport(GLint x, GLint y, GLsizei width, GLsizei height);
};

interface mixin WebGLRenderingContextOverloads
{
    undefined bufferData(GLenum target, GLsizeiptr size, GLenum usage);
    undefined bufferData(GLenum target, /*[AllowShared]*/ BufferSource? data, GLenum usage);
    undefined bufferSubData(GLenum target, GLintptr offset, /*[AllowShared]*/ BufferSource data);

    undefined compressedTexImage2D(GLenum target, GLint level, GLenum internalformat,
                              GLsizei width, GLsizei height, GLint border,
                              /*[AllowShared]*/ ArrayBufferView data);
    undefined compressedTexSubImage2D(GLenum target, GLint level,
                                 GLint xoffset, GLint yoffset,
                                 GLsizei width, GLsizei height, GLenum format,
                                 /*[AllowShared]*/ ArrayBufferView data);

    undefined readPixels(GLint x, GLint y, GLsizei width, GLsizei height,
                    GLenum format, GLenum type, /*[AllowShared]*/ ArrayBufferView? pixels);

    [Throws]
    undefined texImage2D(GLenum target, GLint level, GLint internalformat,
                    GLsizei width, GLsizei height, GLint border, GLenum format,
                    GLenum type, /*[AllowShared]*/ ArrayBufferView? pixels);
    [Throws]
    undefined texImage2D(GLenum target, GLint level, GLint internalformat,
                    GLenum format, GLenum type, TexImageSource source); // May throw DOMException

    [Throws]
    undefined texSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset,
                       GLsizei width, GLsizei height,
                       GLenum format, GLenum type, /*[AllowShared]*/ ArrayBufferView? pixels);
    [Throws]
    undefined texSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset,
                       GLenum format, GLenum type, TexImageSource source); // May throw DOMException

    undefined uniform1fv(WebGLUniformLocation? location, Float32List v);
    undefined uniform2fv(WebGLUniformLocation? location, Float32List v);
    undefined uniform3fv(WebGLUniformLocation? location, Float32List v);
    undefined uniform4fv(WebGLUniformLocation? location, Float32List v);

    undefined uniform1iv(WebGLUniformLocation? location, Int32List v);
    undefined uniform2iv(WebGLUniformLocation? location, Int32List v);
    undefined uniform3iv(WebGLUniformLocation? location, Int32List v);
    undefined uniform4iv(WebGLUniformLocation? location, Int32List v);

    undefined uniformMatrix2fv(WebGLUniformLocation? location, GLboolean transpose, Float32List value);
    undefined uniformMatrix3fv(WebGLUniformLocation? location, GLboolean transpose, Float32List value);
    undefined uniformMatrix4fv(WebGLUniformLocation? location, GLboolean transpose, Float32List value);
};

[Exposed=(Window,Worker)]
interface WebGLRenderingContext
{
};
WebGLRenderingContext includes WebGLRenderingContextBase;
WebGLRenderingContext includes WebGLRenderingContextOverloads;
