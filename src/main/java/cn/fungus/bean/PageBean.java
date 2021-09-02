package cn.fungus.bean;

import java.util.List;

public class PageBean<T> {
    private Long totalCount;     //总记录数
    private Long totalPage;      //总页码数
    private List<T> list;       //每页的页码数
    private int currentPage;    //当前页码
    private int rows;           //每页显示的记录数
    private int start;           //每页开始的数字

    public PageBean() {
        super();
    }

    public PageBean(Long totalCount, Long totalPage, List<T> list, int currentPage, int rows) {
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.list = list;
        this.currentPage = currentPage;
        this.rows = rows;
    }

    public PageBean(Long totalCount, Long totalPage, List<T> list, int currentPage, int rows, int start) {
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.list = list;
        this.currentPage = currentPage;
        this.rows = rows;
        this.start = start;
    }

    public PageBean(Long totalCount, Long totalPage, int currentPage, int rows) {
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.currentPage = currentPage;
        this.rows = rows;
    }

    public PageBean(Long totalCount, Long totalPage, int currentPage, int rows, int start) {
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.currentPage = currentPage;
        this.rows = rows;
        this.start = start;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", list=" + list +
                ", currentPage=" + currentPage +
                ", rows=" + rows +
                ", start=" + start +
                '}';
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public Long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Long totalCount) {
        this.totalCount = totalCount;
    }

    public Long getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Long totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }
}
