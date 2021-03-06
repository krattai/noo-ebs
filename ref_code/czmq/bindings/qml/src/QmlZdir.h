/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
*/

#ifndef QML_ZDIR_H
#define QML_ZDIR_H

#include <QtQml>

#include <czmq.h>
#include "qml_czmq_plugin.h"


class QmlZdir : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isNULL READ isNULL)
    
public:
    zdir_t *self;
    
    QmlZdir() { self = NULL; }
    bool isNULL() { return self == NULL; }
    
    static QObject* qmlAttachedProperties(QObject* object); // defined in QmlZdir.cpp
    
public slots:
    //  Return directory path
    const QString path ();

    //  Return last modification time for directory.
    time_t modified ();

    //  Return total hierarchy size, in bytes of data contained in all files
    //  in the directory tree.                                              
    off_t cursize ();

    //  Return directory count
    size_t count ();

    //  Returns a sorted list of zfile objects; Each entry in the list is a pointer  
    //  to a zfile_t item already allocated in the zdir tree. Do not destroy the     
    //  original zdir tree until you are done with this list. The caller must destroy
    //  the list when done with it.                                                  
    QmlZlist *list ();

    //  Remove directory, optionally including all files that it contains, at  
    //  all levels. If force is false, will only remove the directory if empty.
    //  If force is true, will remove all files and all subdirectories.        
    void remove (bool force);

    //  Return full contents of directory as a zdir_patch list.
    QmlZlist *resync (const QString &alias);

    //  Load directory cache; returns a hash table containing the SHA-1 digests
    //  of every file in the tree. The cache is saved between runs in .cache.  
    //  The caller must destroy the hash table when done with it.              
    QmlZhash *cache ();

    //  Print contents of directory to open stream
    void fprint (FILE *file, int indent);

    //  Print contents of directory to stdout
    void print (int indent);
};

class QmlZdirAttached : public QObject
{
    Q_OBJECT
    QObject* m_attached;
    
public:
    QmlZdirAttached (QObject* attached) {
        Q_UNUSED (attached);
    };
    
public slots:
    //  Calculate differences between two versions of a directory tree.    
    //  Returns a list of zdir_patch_t patches. Either older or newer may  
    //  be null, indicating the directory is empty/absent. If alias is set,
    //  generates virtual filename (minus path, plus alias).               
    QmlZlist *diff (QmlZdir *older, QmlZdir *newer, const QString &alias);

    //  Self test of this class.
    void test (bool verbose);

    //  Create a new directory item that loads in the full tree of the specified
    //  path, optionally located under some parent path. If parent is "-", then 
    //  loads only the top-level directory, and does not use parent as a path.  
    QmlZdir *construct (const QString &path, const QString &parent);

    //  Destroy a directory tree and all children it contains.
    void destruct (QmlZdir *qmlSelf);
};


QML_DECLARE_TYPEINFO(QmlZdir, QML_HAS_ATTACHED_PROPERTIES)

#endif
/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
*/
