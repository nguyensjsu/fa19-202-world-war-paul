/* (c) Copyright 2018 Paul Nguyen. All Rights Reserved */


/** Display Component Interface */
public interface IDisplayComponent
{
    /**
     * Display Component Contents
     */
    void display() ;

    /**
     * Add A Child Component
     * @param c Child Component
     */
    void addSubComponent( IDisplayComponent c ) ;
}
