[ | gsSharedRepo |
  gsSharedRepo := Smalltalk os environment at: 'GS_SHARED_REPO'.
  Metacello new
    baseline: 'Metacello';
    repository: gsSharedRepo, '/metacello-work/repository';
    get.
  Metacello new
    baseline: 'Metacello';
    repository: gsSharedRepo, '/metacello-work/repository';
    onConflict: [:ex | ex allow];
    load.
  Metacello new
    baseline: 'FileTree';
    repository: gsSharedRepo, '/filetree/repository';
    lock.
  Metacello new
    baseline: 'Ston';
    repository: gsSharedRepo, '/ston/repository';
    lock.
  Metacello new
    baseline: 'Tode-Core';
    repository: gsSharedRepo, '/tode/repository';
    get;
    load ]
      on: Warning, MetacelloSkipDirtyPackageLoad
      do: [:ex | 
        (ex isKindOf: MetacelloSkipDirtyPackageLoad)
          ifTrue: [ 
            "Load over dirty packages"
            ex resume: false ]
          ifFalse: [
            Transcript cr; show: ex description.
            ex resume: true ] ].