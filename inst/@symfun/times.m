%% Copyright (C) 2014, 2016, 2019 Colin B. Macdonald
%%
%% This file is part of OctSymPy.
%%
%% OctSymPy is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published
%% by the Free Software Foundation; either version 3 of the License,
%% or (at your option) any later version.
%%
%% This software is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty
%% of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
%% the GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public
%% License along with this software; see the file COPYING.
%% If not, see <http://www.gnu.org/licenses/>.

%% -*- texinfo -*-
%% @documentencoding UTF-8
%% @defop  Method   @@symfun times {(@var{f}, @var{g})}
%% @defopx Operator @@symfun {@var{f} .* @var{g}} {}
%% Symbolic function component-wise multiplication.
%%
%% Example:
%% @example
%% @group
%% syms x y
%% f(x, y) = sym([1 2; 3 4]);
%% g(x, y) = [x 0; 2 y];
%% @end group
%%
%% @group
%% h = f .* g
%%   @result{} h(x, y) = (symfun)
%%       ⎡x    0 ⎤
%%       ⎢       ⎥
%%       ⎣6   4⋅y⎦
%% @end group
%% @end example
%%
%% @seealso{@@symfun/mtimes}
%% @end defop

function h = times(f, g)
  [vars, s1, s2] = helper_symfun_binops(f, g);
  h = symfun(s1 .* s2, vars);
end


%!test
%! syms x
%! f(x) = x^2;
%! assert( isa(f .* f, 'symfun'))
%! assert( isa(f .* x, 'symfun'))

%!test
%! syms x
%! f(x) = [x 2*x];
%! h = f.*[x 3];
%! assert( isa(h, 'symfun'))
%! assert (isequal (formula (h), [x^2 6*x]))
