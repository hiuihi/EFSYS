package cn.fungus.utils;

import java.io.Serializable;
import java.util.Map;

/**
 *
 * 类名称：Result
 * 类描述：  结果对象
 * @version
 */
//@ApiModel(description = "Result实体类")
public class Result<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 编码
     */
//    @ApiModelProperty(value = "编码")
    private int code;

    /**
     * 是否操作成功
     */
//    @ApiModelProperty(value = "是否操作成功")
    private boolean success;

    /**
     * 提示信息
     */
//    @ApiModelProperty(value = "提示信息")
    private String message;

    /**
     * 返回结果
     */
//    @ApiModelProperty(value = "返回结果")
    private T result;

    private String icon;

    public Result() {
        this(1, null, null, null);
    }

    public Result(int code) {
        this(code, null, null, null);
    }

    public Result(int code, Map<String, String> params) {
        this(code, params, null, null);
    }

    public Result(int code, T result) {
        this(code, null, null, result);
    }

    public Result(int code, Map<String, String> params, T result) {
        this(code, params, null, result);
    }

    public Result(int code, String message, T result) {
        this(code, null, message, result);
    }
    public Result(int code, String message,String icon){
        this.code=code;
        this.message=message;
        this.icon=icon;
    }

    public Result(boolean isSuccess, String message, T result) {
        this((isSuccess ? 1 : 0), null, message, result);
    }

    public Result(int code, Map<String, String> params, String message, T result) {
        this.code = code;
        this.success = 1 == code;
        this.message = message ;
        this.result = result;
    }

    /**
     * 新建结果对象
     *
     * @param isSuccess
     * @return
     */
    public static <T> Result<T> newResult(boolean isSuccess) {
        return new Result<T>(isSuccess, null, null);
    }

    /**
     * 新建结果对象
     *
     * @param code
     * @param result
     * @return
     */
    public static <T> Result<T> newResult(int code, T result) {
        return new Result<T>(code, result);
    }

    /**
     * 新建结果对象
     *
     * @param code
     * @param params
     * @return
     */
    public static <T> Result<T> newResult(int code, Map<String, String> params) {
        return new Result<T>(code, params, null);
    }

    /**
     * 新建结果对象
     *
     * @param code
     * @param params
     * @param result
     * @return
     */
    public static <T> Result<T> newResult(int code, Map<String, String> params, T result) {
        return new Result<T>(code, params, result);
    }

    /**
     * 新建结果对象
     *
     * @param code
     * @param message
     * @param result
     * @return
     */
    public static <T> Result<T> newResult(int code, String message, T result) {
        return new Result<T>(code, message, result);
    }
    public static Result newResult(int code, String message, String icon) {
        return new Result(code, message, icon);
    }
    /**
     * 新建结果对象
     *
     * @param isSuccess
     * @param message
     * @param result
     * @return
     */
    public static <T> Result<T> newResult(boolean isSuccess, String message, T result) {
        return new Result<T>(isSuccess, message, result);
    }
    /**
     * 新建成功结果对象
     *
     * @return
     */
    public static <T> Result<T> newSuccessResult() {
        return newResult(true, null, null);
    }

    /**
     * 新建成功结果对象
     *
     * @param result
     * @return
     */
    public static <T> Result<T> newSuccessResult(T result) {
        return newResult(true, null, result);
    }

    /**
     * 新建失败结果对象
     *
     * @return
     */
    public static <T> Result<T> newFailureResult(String message) {
        return new Result<T>(0, null, message, null);
    }

    /**
     * 新建失败结果对象
     *
     * @param code
     * @return
     */
    public static <T> Result<T> newFailureResult(int code) {
        return new Result<T>(code, null, null, null);
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public boolean getSuccess() {
        return success;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setResult(T result) {
        this.result = result;
    }

    public T getResult() {
        return result;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }
}

