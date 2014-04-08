function h = horzcat(varargin)

  cmd = [ 'def fcn(_ins):\n'  ...
          '    x = _ins[0]\n'  ...
          '    sys.stderr.write("pydebug hcat: " + str(_ins) + "\\n")\n'  ... 
          '    _proc = []\n'  ...   
          '    for i in _ins:\n'  ...
          '        if i.is_Matrix:\n'  ...   
          '            _proc.append(i)\n'  ...   
          '        else:\n'  ...   
          '            _proc.append(sp.Matrix([[i]]))\n'  ...
          '    #sys.stderr.write("pydebug hcat: " + str(_proc) + "\\n")\n'  ...  
          '    M = sp.Matrix.hstack(*_proc)\n'           ...
          '    sys.stderr.write("pydebug hcat: " + str(M) + "\\n")\n'  ...      
          '    return (M,)\n' ];

  for i=1:nargin
    varargin{i} = sym(varargin{i}); % make each a sym
  end
  h = python_sympy_cmd(cmd, varargin{:});

